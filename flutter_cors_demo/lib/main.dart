import 'package:flutter/material.dart';

void main() {
  runApp(const CORSDemoApp());
}

class CORSDemoApp extends StatelessWidget {
  const CORSDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CORSDemoHomeScreen(),
    );
  }
}

class CORSDemoHomeScreen extends StatelessWidget {
  const CORSDemoHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageCard(
              imageUrl:
                  'https://img.wowtv.co.kr/wowtv_news/dnrs/20220406/2022040609081102402d3244b4fed58141237161.jpg',
              title: 'Access-Control-Allow-Origin: *',
            ),
            ImageCard(
              imageUrl: 'https://i.ytimg.com/vi/dKUIrNKpPq0/hq720.jpg',
              title: 'Cross-Origin-Resource-Policy: cross-origin',
            ),
            ImageCard(
              imageUrl:
                  'https://proxy-sv6gmz2wba-uc.a.run.app?resourceUrl=https://i.ytimg.com/vi/dKUIrNKpPq0/hq720.jpg',
              title: 'Access-Control-Allow-Origin: * by Proxy',
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  const ImageCard({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              width: 400,
              child: Image.network(
                imageUrl,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text("이미지 로딩에 실패했습니다."),
                    ),
                  );
                },
              ),
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
