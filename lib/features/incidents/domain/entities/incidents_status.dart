class IncsStatus {
  final List<IncCount> incidents;

  IncsStatus({
    required this.incidents,
  });
}

class IncCount {
  final int status;
  final Count count;

  IncCount({
    required this.status,
    required this.count,
  });
}

class Count {
  final int status;

  Count({
    required this.status,
  });
}
