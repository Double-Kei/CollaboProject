import 'package:flutter/material.dart';


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
          print( 'Save button clicked' );
        },
      ),
    );
  }
}
