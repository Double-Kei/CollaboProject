import 'package:flutter/material.dart';

void main() => runApp( const NotepadApp() );

class NotepadApp extends StatelessWidget {
  const NotepadApp( { super.key } );

  @override
  Widget build( BuildContext context ) {
    return MaterialApp(
      title: 'Notepad',
      theme: ThemeData(
          primarySwatch: Colors.green
      ),
      home: const NotepadPage( title: 'Notepad page' ),
    );
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
          // elevation: 0.0,
          leading: IconButton(
              icon: const Icon( Icons.menu ),
              onPressed: () {
                print( 'Hamburger button clicked' );
              }
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
            child: SingleChildScrollView(
                child: Column(
                    children: [
                      const TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Title'
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
                            hintText: 'Content'
                        ),
                        maxLines: 10,
                      ),
                    ]
                )
            )
        )
    );
  }
}
