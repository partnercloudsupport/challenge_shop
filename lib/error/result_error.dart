class ResultError extends Error {
  int errorCode;
  String errorMsg;
  ResultError(this.errorCode, this.errorMsg);

  @override
  String toString() {
    return "错误码${errorCode}\n${errorMsg}";
  }
}
