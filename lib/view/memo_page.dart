import 'package:collabo_project/model/memo_model.dart';
import 'package:collabo_project/provider/memo_provider.dart';

import 'package:flutter/material.dart';


class MemoPage extends StatefulWidget {
  const MemoPage( { super.key } );

  @override
  _MemoPageState createState() => _MemoPageState();
}


class _MemoPageState extends State< MemoPage > {
  final title = TextEditingController();
  final text = TextEditingController();

  Future< void > save() async {
    var query = MemoProvider();
    var memo = Memo( title: title.text, text: text.text );
    query.insert( memo );
  }

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'New memo' ),
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
