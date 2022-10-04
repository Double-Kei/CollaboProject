import 'package:flutter/material.dart';

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
      'id': id,
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

  const MemoSummary( { super.key, required this.data } );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Material (
          color: Colors.lightBlueAccent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: < Widget >[
              Text(
                'id: ${data.id}  title: ${data.title}',
                style: const TextStyle( fontSize: 20, color: Colors.black87 ),
              ),
              Text(
                'text: ${data.text}',
                style: const TextStyle( fontSize: 15, color: Colors.black45 ),
              )
            ],
          )
      ),
    );
  }
}
