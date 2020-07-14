class PageResponse<T> {
  int count;
  List<T> rows;

  PageResponse({this.count, this.rows});

  PageResponse.fromJson(
      Map<String, dynamic> json, T fromJson(Map<String, dynamic> obj)) {
    count = json['count'];

    var rowJson = json['rows'] as List;
    rows = rowJson.map((item) => fromJson(item)).toList();
  }
}
