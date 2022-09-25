import 'package:flutter/material.dart';
import 'notepad_page.dart';


void main() => runApp( const NotepadApp() );

class NotepadApp extends StatelessWidget {
  const NotepadApp( { super.key } );

  @override
  Widget build( BuildContext context ) {
    return MaterialApp(
      title: 'Notepad',
      home: NotepadPage(),
    );
  }
}