/// Cancellable protocol which allow you cancel the pending/running operation.
abstract class Cancellable {
  /// Cancel a pending/running operation, i.e., a http request.
  void cancel();
}
