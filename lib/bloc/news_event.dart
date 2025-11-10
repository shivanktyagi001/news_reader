import 'package:equatable/equatable.dart';

abstract class NewsEvent extends Equatable{
  @override
  List<Object?>get props => [];
}
class FetchTopHeadlines extends NewsEvent{
  final String category;
  FetchTopHeadlines({this.category= 'general'});
  @override
  List<Object?>get props =>[category];
}
class NewsRefresh extends NewsEvent{

}