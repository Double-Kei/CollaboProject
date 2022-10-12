import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Memo {
  int? id;
  String? title;
  String? text;

  Memo( { this.id, this.title, this.text } );

  @override
  String toString() {
    return '[Memo] id: $id, title: $title, text: $text';
  }

  Map< String, dynamic > toMap() {
    return {
      'title': title,
      'text': text,
    };
  }

  factory Memo.fromMap( Map< String, dynamic > map ) {
    return Memo(
      id: map[ 'id' ],
      title: map[ 'title' ],
      text: map[ 'text' ],
    );
  }
}

class MemoSummary extends StatelessWidget {
  final Memo data;
  final Function( Memo memo ) onEdit;

  const MemoSummary( { super.key, required this.data, required this.onEdit } );

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey( data.id ),
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: ( context ) {},
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: ( context ) { onEdit( data ); },
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Edit',
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          'id: ${data.id}  title: ${data.title}',
          style: const TextStyle( fontSize: 20, color: Colors.black87 ),
        ),
        subtitle: Text(
          'text: ${data.text}',
          style: const TextStyle( fontSize: 15, color: Colors.black45 ),
        ),
      )
    );
  }
}
