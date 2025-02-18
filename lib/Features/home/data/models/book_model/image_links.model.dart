import 'package:equatable/equatable.dart';

class ImageLinks extends Equatable {
  final String? smallThumbnail;
  final String?thumbnail;

  const ImageLinks({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json['smallThumbnail'] !=null ? json['smallThumbnail'] as String? :null,
        thumbnail: json['thumbnail'] !=null ?json['thumbnail']  as String? :null,
      );

  Map<String, dynamic> toJson() => {
        'smallThumbnail': smallThumbnail,
        'thumbnail': thumbnail,
      };

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}
