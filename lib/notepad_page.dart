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

  Future< List < Page > > select() async {
    final Database? db = await database;
    final List< Map< String, dynamic > > rows = await db!.query( 'notepad_page' );
    if ( rows.isEmpty ) {
      return [];
    }

    return List.generate( rows.length, ( i ) {
      return Page (
        id: rows[ i ][ 'id' ],
        title: rows[ i ][ 'title' ],
        text: rows[ i ][ 'page_text' ],
      );
    } );
  }
}


class NotepadPage extends StatelessWidget {
  const NotepadPage( { super.key, required this.title } );

  final String title;

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text( title ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all( 10.0 ),
          child: SingleChildScrollView(
              child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
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
                    const TextField(
                      decoration: InputDecoration(
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

        },
      ),
    );
  }
}
