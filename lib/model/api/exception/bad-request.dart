import 'package:mobile/model/api/exception/abstract-exception.dart';
import 'package:mobile/model/form/field-error.dart';

class BadRequestException extends AbstractException {
  List<FieldError> errors;

  BadRequestException(this.errors) : super('Bad Request');

  static BadRequestException fromJSON(dynamic json) {
    var rowJson = json as List;
    return new BadRequestException(
        rowJson.map((item) => FieldError.fromJson(item)).toList());
  }
}
