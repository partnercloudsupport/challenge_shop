class UnLoginResultError extends Error {
  int errorCode;
  String errorMsg;
  UnLoginResultError(this.errorCode, this.errorMsg);

  @override
  String toString() {
    return "错误码${errorCode}\n${errorMsg}";
  }
}
