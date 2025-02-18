import 'package:equatable/equatable.dart';

import 'image_links.model.dart';
import 'industry_identifier.model.dart';
import 'panelization_summary.model.dart';
import 'reading_modes.model.dart';

class VolumeInfo extends Equatable {
  final String? title;
  final List<dynamic>? authors;
  final String? publisher;
  final String? publishedDate;
  final List<IndustryIdentifier>? industryIdentifiers;
  final ReadingModes? readingModes;
  final int? pageCount;
  final String? printType;
  final List<dynamic>? categories;
  final num ? averageRating;
  final num  ?ratingsCount;
  final String? maturityRating;
  final bool? allowAnonLogging;
  final String? contentVersion;
  final PanelizationSummary? panelizationSummary;
  final ImageLinks  ?imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;

  const VolumeInfo({
    this.title,
    required this.authors,
    this.publisher,
    this.publishedDate,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    required this.categories,
       this.averageRating,
     this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    required this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'] !=null ?json['title'] as String?: 'Book',
        authors: json['authors'] !=null ? json['authors']as List<dynamic>?:null,
        publisher: json['publisher'] as String?,
        publishedDate: json['publishedDate'] as String?,
        industryIdentifiers: (json['industryIdentifiers'] as List<dynamic>?)
            ?.map((e) => IndustryIdentifier.fromJson(e as Map<String, dynamic>))
            .toList(),
        readingModes: json['readingModes'] == null
            ? null
            : ReadingModes.fromJson(
                json['readingModes'] as Map<String, dynamic>),
        pageCount: json['pageCount'] as int?,
        printType: json['printType'] as String?,
        categories: json['categories'] as List<dynamic>?,
        averageRating: json['averageRating'] as num?,
        ratingsCount: json['ratingsCount'] as num?,
        maturityRating: json['maturityRating'] as String?,
        allowAnonLogging: json['allowAnonLogging'] as bool?,
        contentVersion: json['contentVersion'] as String?,
        panelizationSummary: json['panelizationSummary'] == null
            ? null
            : PanelizationSummary.fromJson(
                json['panelizationSummary'] as Map<String, dynamic>),
        imageLinks: json['imageLinks'] !=null   ? ImageLinks.fromJson(json['imageLinks']  as Map<String, dynamic>) :null,
        language: json['language'] as String?,
        previewLink: json['previewLink'] as String?,
        infoLink: json['infoLink'] as String?,
        canonicalVolumeLink: json['canonicalVolumeLink'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'authors': authors,
        'publisher': publisher,
        'publishedDate': publishedDate,
        'industryIdentifiers':
            industryIdentifiers?.map((e) => e.toJson()).toList(),
        'readingModes': readingModes?.toJson(),
        'pageCount': pageCount,
        'printType': printType,
        'categories': categories,
        'averageRating': averageRating,
        'ratingsCount': ratingsCount,
        'maturityRating': maturityRating,
        'allowAnonLogging': allowAnonLogging,
        'contentVersion': contentVersion,
        'panelizationSummary': panelizationSummary?.toJson(),
        'imageLinks': imageLinks?.toJson(),
        'language': language,
        'previewLink': previewLink,
        'infoLink': infoLink,
        'canonicalVolumeLink': canonicalVolumeLink,
      };

  @override
  List<Object?> get props {
    return [
      title,
      authors,
      publisher,
      publishedDate,
      industryIdentifiers,
      readingModes,
      pageCount,
      printType,
      categories,
      averageRating,
      ratingsCount,
      maturityRating,
      allowAnonLogging,
      contentVersion,
      panelizationSummary,
      imageLinks,
      language,
      previewLink,
      infoLink,
      canonicalVolumeLink,
    ];
  }
}
