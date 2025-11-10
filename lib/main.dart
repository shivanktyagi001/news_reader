import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_reader/Screens/spash_screen.dart';
import 'package:news_reader/bloc/news_bloc.dart';
import 'package:news_reader/bloc/news_event.dart';
import 'package:news_reader/bloc/news_bloc.dart';
import 'package:news_reader/data/repositories/news_repositories.dart';
import 'package:news_reader/screens/home_screen.dart';

void main() {
  runApp(MyNewsApp());
}

class MyNewsApp extends StatelessWidget {
  const MyNewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(NewsRepositories())..add(FetchTopHeadlines()),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'GNews Reader',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        home:  SplashScreen(),
      ),
    );
  }
}
