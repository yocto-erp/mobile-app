abstract class AbstractSearchForm {
  toQueryString();
}

class VoidAbstractSearchParam extends AbstractSearchForm {
  @override
  toQueryString() {
    return "";
  }
}
