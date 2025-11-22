import 'package:flutter/material.dart';
import '../../repositories/post_repository.dart';
import '../../models/post.dart';

import 'widgets/home_top_bar.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/info_banner.dart';
import 'widgets/home_filter_bar.dart';
import 'widgets/home_post_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PostRepository repository = PostRepository();
  List<Post> posts = [];
  String selectedFilter = "todos";

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    final list = await repository.getPosts(filter: selectedFilter);
    setState(() => posts = list);
  }

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFF1F1A17);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: RefreshIndicator(
          backgroundColor: Colors.black,
          color: Colors.white,
          onRefresh: _loadPosts,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 10),

                const HomeTopBar(),
                const SizedBox(height: 12),

                const HomeSearchBar(),
                const SizedBox(height: 12),

                const InfoBanner(),
                const SizedBox(height: 24),

                HomeFilterBar(
                  selected: selectedFilter,
                  onChanged: (v) {
                    setState(() => selectedFilter = v);
                    _loadPosts();
                  },
                ),

                const SizedBox(height: 24),

                if (posts.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                      "Nenhuma publicação encontrada.",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                for (final p in posts)
                  HomePostCard(post: p),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFB89278),
        onPressed: () => Navigator.pushNamed(context, '/create_post'),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
