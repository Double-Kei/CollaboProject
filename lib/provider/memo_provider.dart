import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:collabo_project/model/memo_model.dart';


class MemoProvider {
  late Database _database;

  Future< Database? > get database async {
    _database = await create();
    return _database;
  }

  create() async {
    return await openDatabase(
      join( await getDatabasesPath(), 'memo.db' ),
      onCreate: ( db, version ) {
        return db.execute(
            '''
            CREATE TABLE memo(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              title TEXT,
              text TEXT
            )
          '''
        );
      },
      onUpgrade: (db, oldVersion, newVersion) {},
      version: 1,
    );
  }

  Future< void > insert( Memo memo ) async {
    final Database? db = await database;
    memo.id = await db!.transaction( (txn) => txn.insert( 'memo', memo.toMap() ) );

    print( 'insert memo. $memo' );
  }

  Future< List < Memo > > selectAll() async {
    final Database? db = await database;
    final List< Map< String, dynamic > > rows = await db!.query( 'memo' );
    if ( rows.isEmpty ) {
      return [];
    }

    return List.generate( rows.length, ( i ) {
      Memo memo = Memo.fromMap( rows[ i ] );
      print( 'select all. [$i] - $memo' );
      return memo;
    } );
  }

  Future< void > update( Memo memo ) async {
    final Database? db = await database;
    await db!.update(
      'memo',
      memo.toMap(),
      where: "id = ?",
      whereArgs: [ memo.id ],
    );

    print( 'update memo. $memo' );
  }

  Future< void > delete( Memo memo ) async {
    print( 'delete memo. ${memo.id}' );

    final Database? db = await database;
    await db!.delete(
      'memo',
      where: "id = ?",
      whereArgs: [ memo.id ],
    );
  }
}
