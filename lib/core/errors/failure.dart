// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {
  String errorMessage;
  Failure({required this.errorMessage});
}

class EmptyLocalCacheFailure extends Failure {
  EmptyLocalCacheFailure({required super.errorMessage});
}
