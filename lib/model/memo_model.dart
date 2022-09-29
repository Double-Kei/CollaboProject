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