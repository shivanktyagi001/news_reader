import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_reader/bloc/news_bloc.dart';
import 'package:news_reader/bloc/news_event.dart';
import 'package:news_reader/bloc/news_state.dart';
import 'package:news_reader/widget/newstile.dart';
import 'package:shimmer/shimmer.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      body: BlocBuilder<NewsBloc,NewsState>(
          builder: (context,state){
            if(state is NewsLoading){
              return Center(child: CircularProgressIndicator(),);
            }else if(state is NewsLoaded){
              return RefreshIndicator(
                onRefresh: () async{
                  context.read<NewsBloc>().add(FetchTopHeadlines());
                },
                child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: state.articles.length,
                    itemBuilder: (context,idx){
                     return ArticleTile(article: state.articles[idx]).animate().fadeIn(duration: 400.ms).slideY(begin: 0.2,end: 0);
                    }),
              );
            }else if(state is NewsError){
              return Center(child: Text(state.error),);
            }else{
              return const  SizedBox.shrink();
            }
          }),
    );
  }
}
