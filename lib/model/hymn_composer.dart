class ComposeHymns {
  String? author;
  int? id;
  String? lyric;
  String? title;
  String? tune;

  ComposeHymns({this.author, this.id, this.lyric, this.title, this.tune});

  factory ComposeHymns.fromJson(Map<String, dynamic> json) {
    return ComposeHymns(
      author: json['author'],
      id: json['id'],
      lyric: json['lyric'],
      title: json['title'],
      tune: json['tune'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['id'] = this.id;
    data['lyric'] = this.lyric;
    data['title'] = this.title;
    data['tune'] = this.tune;
    return data;
  }
}
