class DaoCompany {
  String id;
  String companyName;
  List<PaymentInfo> paymentInfo;
  bool status;

  DaoCompany({
    this.id = '',
    required this.companyName,
    required this.paymentInfo,
    this.status = true,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'companyName': companyName,
        'paymentInfo': paymentInfo.map((x) => x.toJson()),
        'status': status,
      };

  factory DaoCompany.fromJson(Map<String, dynamic> json) => DaoCompany(
        companyName: json['companyName'],
        paymentInfo: json['paymentInfo'],
      );
}

class PaymentInfo {
  String type;
  List<ContactInfo> contactInfo;

  PaymentInfo({
    this.type = 'primary',
    required this.contactInfo,
  });

  Map<String, dynamic> toJson() => {
        'type': type,
        'contactInfo': contactInfo.map((x) => x.toJson()),
      };

  factory PaymentInfo.fromJson(Map<String, dynamic> json) => PaymentInfo(
        contactInfo: json['contactInfo'],
      );
}

class ContactInfo {
  String type;
  String name;
  List<DataPair> phyicalAddress;
  List<DataPair> emailAddress;
  List<DataPair> phone;

  ContactInfo({
    this.type = 'primary',
    required this.name,
    required this.phyicalAddress,
    required this.emailAddress,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        'type': type,
        'name': name,
        'phyicalAddress': phyicalAddress.map((x) => x.toJson()).toList(),
        'emailAddress': emailAddress.map((x) => x.toJson()).toList(),
        'phone': phone.map((x) => x.toJson()).toList(),
      };
}

class DataPair {
  String type;
  String data;
  DataPair({
    this.type = 'primary',
    required this.data,
  });
  Map<String, dynamic> toJson() => {
        'type': type,
        'data': data,
      };
}
