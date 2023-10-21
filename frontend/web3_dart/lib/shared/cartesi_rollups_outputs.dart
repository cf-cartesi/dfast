class Inspect {
  final String status;
  final dynamic exceptionPayload;
  final List<dynamic> reports; // to be interpreted when used
  final int processedInputCount;

  Inspect(
    this.status, this.exceptionPayload, this.reports, this.processedInputCount);

  Inspect.fromJson(Map<String, dynamic> json):
    status = json["status"],
    exceptionPayload = json["exception_payload"],
    reports = json["reports"],
    processedInputCount = json["processed_input_count"];
}