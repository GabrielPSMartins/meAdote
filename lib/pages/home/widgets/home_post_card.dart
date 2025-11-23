import 'package:flutter/material.dart';
import '../../../models/post.dart';

class HomePostCard extends StatelessWidget {
  final Post post;

  const HomePostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final img = post.images.isNotEmpty ? post.images.first : null;

    return Container(
      margin: const EdgeInsets.only(bottom: 22),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D1D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.white12,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(
              post.userName ?? "Desconhecido",
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              "${post.city ?? ''} - ${post.state ?? ''}",
              style: const TextStyle(color: Colors.white54),
            ),
          ),

          if (img != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(img, height: 230, fit: BoxFit.cover),
            ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  post.description ?? "",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 10),

                Row(
                  children: [
                    const Icon(Icons.favorite_border,
                        size: 20, color: Colors.white54),
                    const SizedBox(width: 16),
                    const Icon(Icons.share, size: 20, color: Colors.white54),
                    const Spacer(),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(
                        context,
                        '/interest',
                        arguments: post,
                      ),
                      child: const Text("Tenho Interesse"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
