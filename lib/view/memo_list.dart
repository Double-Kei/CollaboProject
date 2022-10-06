import 'package:collabo_project/model/memo_model.dart';
import 'package:collabo_project/provider/memo_provider.dart';
import 'memo_page.dart';
import 'package:flutter/material.dart';


class MemoList extends StatefulWidget {
  const MemoList( { super.key } );

  @override
  State< MemoList > createState() => _MemoPageState();
}


class _MemoPageState extends State< MemoList > {
  List< Memo > memoList = [];

  List< Widget > getAllMemoList() {
    List< Widget > memos = [];

    for ( var memo in memoList ) {
      memos.add( MemoSummary( data: memo, onEdit: goEdit, ) );
    }

    return memos;
  }

  loadMemoList() async {
    var query = MemoProvider();
    var memos = await query.selectAll();

    setState( () {
      memoList = memos;
    } );
  }

  @override
  void initState() {
    super.initState();
    loadMemoList();
  }

  void goNewMemo() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ( context ) => MemoPage()
        )
    );
  }

  void goEdit( Memo memo ) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: ( context ) => MemoPage()
        )
    );
  }

  @override
  Widget build( BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( 'nemo list' ),
        centerTitle: true,
      ),
      body: Stack(
        // alignment: Alignment.center,
        children: < Widget >[
          ListView(
            physics: const BouncingScrollPhysics(),
            children: < Widget >[
              ...getAllMemoList(),
            ],
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'goNewMemo',
            child: const Icon( Icons.add ),
            onPressed: () {
              goNewMemo();
            },
          ),
        ],
      ),
    );
  }
}
