import 'package:collabo_project/model/memo_model.dart';
import 'package:collabo_project/provider/memo_provider.dart';

import 'package:flutter/material.dart';


class MemoPage extends StatefulWidget {
  const MemoPage( { super.key } );

  @override
  State< MemoPage > createState() => _MemoPageState();
}


class _MemoPageState extends State< MemoPage > {
  final title = TextEditingController();
  final text = TextEditingController();
  Memo? curMemo;
  bool isNew = true;

  Future< void > save() async {
    if ( curMemo == null ) {
      var query = MemoProvider();
      var memo = Memo( title: title.text, text: text.text );
      await query.insert( memo );

      setState(() {
        isNew = false;
        curMemo = memo;
      });
    } else {

      setState(() {
        curMemo?.title = title.text;
        curMemo?.text = text.text;
      });

      var query = MemoProvider();
      query.update( curMemo! );
    }
  }

  Future< void > delete() async {
    if ( curMemo != null ) {
      var query = MemoProvider();
      await query.delete( curMemo! );

      setState(() {
        isNew = true;
        curMemo = null;
      });
    }
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
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'save',
            child: const Icon( Icons.save ),
            onPressed: () {
              save();
            },
          ),
          const SizedBox( height: 10, ),
          FloatingActionButton(
            heroTag: 'delete',
            child: const Icon( Icons.delete ),
            onPressed: () {
              delete();
            },
          )
        ],
      ),
    );
  }
}
