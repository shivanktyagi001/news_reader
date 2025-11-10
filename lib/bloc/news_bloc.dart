import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/bloc/news_event.dart';
import 'package:news_reader/bloc/news_state.dart';
import 'package:news_reader/data/repositories/news_repositories.dart';

class NewsBloc extends Bloc<NewsEvent,NewsState>{
  final NewsRepositories repositories;
  NewsBloc( this.repositories): super(NewsInitaial()){
    on<FetchTopHeadlines>((event,emit) async{
      emit(NewsLoading());
      try{
        final repo = await repositories.fetchHeadlines(category: event.category);
        emit(NewsLoaded(articles: repo));
      }catch(e){
        emit(NewsError(error:'Failed to fetch news'));
      }

    });
    on<NewsRefresh>((event,emit) async{
      try{
        final repo = await repositories.fetchHeadlines();
        emit(NewsLoaded(articles: repo));
      }catch (e){
        emit(NewsError(error: 'Refresh Failed'));
      }
    });
  }

}