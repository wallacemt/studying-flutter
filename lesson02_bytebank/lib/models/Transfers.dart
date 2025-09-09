class Transferencias {
  final double value;
  final int countNumber;

  @override
  String toString() {
    return "Transferencia{valor:${value}, conta:${countNumber}";
  }

  Transferencias(this.value, this.countNumber);
}