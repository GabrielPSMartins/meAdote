import 'package:flutter/material.dart';
import 'package:meadote_inicio/models/post.dart';

class InterestInfoBlock extends StatelessWidget {
  final Post post;

  const InterestInfoBlock({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1D1D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // título do post
          Text(
            post.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 8),

          // localização
          Text(
            "${post.city ?? ''}, ${post.state ?? ''}",
            style: const TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 16),

          // responsável
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: Colors.white12,
                child: Icon(Icons.person, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  post.userName ?? "Responsável desconhecido",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
