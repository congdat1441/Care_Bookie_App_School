
class Service {

  final String hospitalId;
  final String serviceName;
  final num price;

  Service({
    required this.hospitalId,
    required this.serviceName,
    required this.price
  });

  factory Service.fromJson(Map<String,dynamic> json) {

    return Service(
        hospitalId: json['hospitalId'],
        serviceName: json['serviceName'],
        price: json['price']
    );

  }

}