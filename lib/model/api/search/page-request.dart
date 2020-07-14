import 'package:mobile/model/api/search/abstract-search-form.dart';

class PageRequest<T extends AbstractSearchForm> {
  int page;
  int size;
  T search;

  PageRequest({this.page, this.size, this.search});

  PageRequest.fromJson(
      Map<String, dynamic> json, T fromJson(Map<String, dynamic> obj)) {
    page = json['page'];

    var rowJson = json['search'];
    search = fromJson(rowJson);
  }

  String toQueryString() {
    return "page=$page&size=$size&" +
        (this.search != null ? this.search.toQueryString() : "");
  }
}
