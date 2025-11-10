import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:news_reader/data/models/news_model.dart';
import 'package:news_reader/Screens/details_screen.dart';

class ArticleTile extends StatefulWidget {
  final NewsModel article;
  const ArticleTile({required this.article});

  @override
  State<ArticleTile> createState() => _ArticleTileState();
}

class _ArticleTileState extends State<ArticleTile> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final article = widget.article;

    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      closedElevation: 0,
      closedColor: Colors.transparent,
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      closedBuilder: (context, openContainer) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) => setState(() => _isPressed = false),
          onTapCancel: () => setState(() => _isPressed = false),
          onTap: openContainer,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOutCubic,
            transform: Matrix4.identity()
              ..scale(_isPressed ? 0.97 : 1.0), // soft press animation
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: _isPressed
                      ? Colors.transparent
                      : Colors.deepPurpleAccent.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  // 🌄 Smooth image loading
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: article.image != null && article.image!.isNotEmpty
                        ? Image.network(
                      article.image!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 220,
                      key: ValueKey(article.image),
                      loadingBuilder: (context, child, progress) {
                        if (progress == null) return child;
                        return Container(
                          height: 220,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.grey, Colors.black45],
                            ),
                          ),
                        );
                      },
                    )
                        : Container(
                      height: 220,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF232526), Color(0xFF414345)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                    ),
                  ),

                  // 🌌 Dynamic overlay gradient
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    height: 220,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: _isPressed
                            ? [
                          Colors.deepPurple.withOpacity(0.8),
                          Colors.transparent,
                        ]
                            : [
                          Colors.black.withOpacity(0.9),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  // 📰 Title text
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        article.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.5,
                          height: 1.3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      openBuilder: (context, _) => DetailsScreen(article: article),
    );
  }
}
