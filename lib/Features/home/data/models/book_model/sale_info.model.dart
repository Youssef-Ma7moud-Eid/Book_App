import 'package:equatable/equatable.dart';

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;

  const SaleInfo({this.country, this.saleability, this.isEbook});

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json['country'] !=null ? json['country'] as String?:null,
        saleability: json['saleability'] !=null ? json['saleability'] as String? : null,
        isEbook: json['isEbook'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
      };

  @override
  List<Object?> get props => [country, saleability, isEbook];
}
