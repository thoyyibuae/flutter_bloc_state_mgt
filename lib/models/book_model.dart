class BookModel {
  String? sId;
  String? name;
  String? description;
  String? isbn;
  String? authorName;
  String? writtenYear;
  int? iV;

  BookModel(
      {this.sId,
        this.name,
        this.description,
        this.isbn,
        this.authorName,
        this.writtenYear,
        this.iV});

  BookModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    description = json['description'];
    isbn = json['isbn'];
    authorName = json['authorName'];
    writtenYear = json['writtenYear'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['isbn'] = this.isbn;
    data['authorName'] = this.authorName;
    data['writtenYear'] = this.writtenYear;
    data['__v'] = this.iV;
    return data;
  }
}