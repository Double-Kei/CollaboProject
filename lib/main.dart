import 'package:flutter/material.dart';
import 'package:collabo_project/view/memo_list.dart';


void main() => runApp( const NotepadApp() );

class NotepadApp extends StatelessWidget {
  const NotepadApp( { super.key } );

  @override
  Widget build( BuildContext context ) {
    return MaterialApp(
      title: 'Notepad',
      home: MemoList(),
    );
  }
}