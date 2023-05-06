
class InvoiceInformation {

  final int id;
  final String symptomDetail;
  final String advices;
  final String diagnose;
  final String dateTimeInvoice;

  InvoiceInformation({
    required this.id,
    required this.symptomDetail,
    required this.advices,
    required this.diagnose,
    required this.dateTimeInvoice
  });

  factory InvoiceInformation.fromJson(Map<String,dynamic> json) {

    return InvoiceInformation(
        id: json['id'],
        symptomDetail: json['symptomDetail'],
        advices: json['advices'],
        diagnose: json['diagnose'],
        dateTimeInvoice: json['dateTimeInvoice']
    );

  }

}