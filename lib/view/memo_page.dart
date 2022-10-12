import 'package:collabo_project/model/memo_model.dart';
import 'package:collabo_project/provider/memo_provider.dart';

import 'package:flutter/material.dart';


class MemoPage extends StatefulWidget {
  String pageTitle;
  Memo? curMemo;

  MemoPage( { super.key, required this.pageTitle, this.curMemo } );

  @override
  State< MemoPage > createState() => _MemoPageState();
}


class _MemoPageState extends State< MemoPage > {
  late TextEditingController title;
  late TextEditingController text;

  Future< void > save() async {
    if ( widget.curMemo == null ) {
      var query = MemoProvider();
      var memo = Memo( title: title.text, text: text.text );
      await query.insert( memo );

      setState(() {
        widget.curMemo = memo;
      });
    } else {

      setState(() {
        widget.curMemo?.title = title.text;
        widget.curMemo?.text = text.text;
      });

      var query = MemoProvider();
      query.update( widget.curMemo! );
    }
  }

  Future< void > delete() async {
    if ( widget.curMemo != null ) {
      var query = MemoProvider();
      await query.delete( widget.curMemo! );

      setState(() {
        widget.curMemo = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    title = TextEditingController( text: widget.curMemo?.title );
    text = TextEditingController( text: widget.curMemo?.text );
  }

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text( widget.pageTitle ),
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
