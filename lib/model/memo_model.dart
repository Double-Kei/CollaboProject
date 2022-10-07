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
  final Function( Memo memo ) onCopy;
  final Offset _tapPosition = Offset.zero;

  const MemoSummary( { super.key, required this.data, required this.onEdit, required this.onCopy } );

  void showMenuList( BuildContext context ) async {
    final RenderObject? overlay = Overlay.of( context )?.context.findRenderObject();

    final result = await showMenu(
        context: context,
        position: RelativeRect.fromRect(
            Rect.fromLTWH( _tapPosition.dx, _tapPosition.dy, 30, 30 ),
            Rect.fromLTWH( 0, 0, overlay!.paintBounds.size.width, overlay.paintBounds.size.height )
        ),
        items: [
          const PopupMenuItem(
            value: "edit",
            child: Text( "Edit" ),
          ),
          const PopupMenuItem(
            value: "delete",
            child: Text( "Delete" ),
          ),
          const PopupMenuItem(
            value: "copy",
            child: Text( "Copy" ),
          ),
        ]
    );

    switch ( result ) {
      case 'edit':
        print('edit');
        onEdit( data );
        break;
      case 'delete':
        print('delete');
        break;
      case 'copy':
        print('copy');
        onCopy( data );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      color: Colors.grey,
      child: Material(
          color: Colors.grey,
          child: InkWell(
              onLongPress: () => showMenuList( context ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: < Widget > [
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
          )

      ),
    );
  }
}
