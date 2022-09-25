import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


// model
class Page {
  int? id;
  final String title;
  String? text;

  Page( { this.id, required this.title, this.text } );

  @override
  String toString() {
    return 'id: $id, title: $title, text: $text';
  }

  Map< String, dynamic > toMap() {
    return {
      'title': title,
      'page_text': text,
    };
  }
}

class PageQuery {
  late Database _database;

  Future< Database? > get database async {
    _database = await create();
    return _database;
  }

  create() async {
    return await openDatabase(
      join( await getDatabasesPath(), 'notepad_page.db' ),
      onCreate: ( db, version ) {
        return db.execute(
          '''
            CREATE TABLE notepad_page(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              page_text TEXT
            )
          '''
        );
      },
      onUpgrade: (db, oldVersion, newVersion) {},
      version: 1,
    );
  }

  Future< void > insert( Page page ) async {
    final Database? db = await database;
    page.id = await db!.insert( 'notepad_page', page.toMap() );

    print( 'insert page: ' + page.toString() );
  }

  Future< List < Page > > select() async {
    final Database? db = await database;
    final List< Map< String, dynamic > > rows = await db!.query( 'notepad_page' );
    if ( rows.isEmpty ) {
      return [];
    }

    print( 'select all page: ' + rows.toString() );

    return List.generate( rows.length, ( i ) {
      return Page (
        id: rows[ i ][ 'id' ],
        title: rows[ i ][ 'title' ],
        text: rows[ i ][ 'page_text' ],
      );
    } );
  }

  Future< void > update( Page page ) async {
    final Database? db = await database;
    await db!.update(
      'notepad_page',
      page.toMap(),
      where: "id = ?",
      whereArgs: [ page.id ],
    );

    print( 'update page: ' + page.toString() );
  }

  Future< void > delete( int id ) async {
    final Database? db = await database;
    await db!.delete(
      'notepad_page',
      where: "id = ?",
      whereArgs: [ id ],
    );

    print( 'delete page: ' + id.toString() );
  }
}


class NotepadPage extends StatefulWidget {
  NotepadPage( { super.key } );

  @override
  _NotepadPageState createState() => _NotepadPageState();
}


class _NotepadPageState extends State< NotepadPage > {
  final title = TextEditingController();
  final text = TextEditingController();

  Future< void > save() async {
    var query = PageQuery();
    var page = Page( title: title.text, text: text.text );
    query.insert( page );
  }

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'New page' ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all( 10.0 ),
          child: SingleChildScrollView(
              child: Column(
                  children: [
                    TextField(
                      controller: title,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Input title'
                      ),
                    ),
                    Divider(
                      height: 10.0,
                      color: Colors.grey[800],
                      thickness: 0.5,
                      endIndent: 0.0,
                    ),
                    const SizedBox( height: 5.0 ),
                    TextField(
                      controller: text,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Input content'
                      ),
                      maxLines: 10,
                    ),
                  ]
              )
          )
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Save',
        child: const Icon( Icons.save ),
        onPressed: () {
          save();
        },
      ),
    );
  }
}
