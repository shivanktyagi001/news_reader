import 'package:equatable/equatable.dart';
import 'package:news_reader/data/models/news_model.dart';

abstract class NewsState extends Equatable{
  @override
  List<Object?>get props => [];
}
class NewsInitaial extends NewsState{}
class NewsLoading extends NewsState{}

class NewsLoaded extends NewsState{
  final List<NewsModel> articles;
  NewsLoaded({required this.articles});
  @override
  List<Object?>get props => [articles];
}
class NewsError extends NewsState{
  final String error;
  NewsError({required this.error});
  @override
  List<Object?>get props => [error];
}