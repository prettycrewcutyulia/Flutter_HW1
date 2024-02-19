// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      title: json['title'] as String,
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'] ?? 'https://images.unsplash.com/photo-1532210317995-cc56d90177d9?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
    };
