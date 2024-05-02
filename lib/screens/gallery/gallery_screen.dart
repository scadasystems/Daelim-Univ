import 'dart:convert';

import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/models/gallery_item.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  bool _isLoading = false;
  GalleryItem? _galleryItem;

  void _showLoading() {
    setState(() {
      _galleryItem = null;
      _isLoading = true;
    });
  }

  void _hideLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('갤러리'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // API 호출
          /*
          curl -X POST 'http://121.140.73.79:60080/functions/v1/gallery' \
          -H 'Content-Type: application/json' \
          -d '{
              "q": "검색어", 
              "page": 페이지 수,
              "per_page": 페이지별 이미지 개수
          }'
          */

          _showLoading();

          var response = await http
              .post(
            Uri.parse(
              'http://121.140.73.79:60080/functions/v1/gallery',
            ),
            body: jsonEncode({
              'q': '새',
            }),
          )
              .catchError((e) {
            return http.Response('$e', 401);
          });

          var statusCode = response.statusCode;

          _hideLoading();

          if (statusCode != 200) {
            Log.red('API 호출 실패');
            return;
          }

          var body = jsonDecode(utf8.decode(response.bodyBytes));

          setState(() {
            _galleryItem = GalleryItem.fromMap(body);
          });
        },
        child: const Icon(
          Icons.refresh,
        ),
      ),
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: _galleryItem?.hits.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                var item = _galleryItem?.hits[index];

                return Image.network(
                  item?.webformatURL ?? '',
                  fit: BoxFit.cover,
                );
              },
            ),
    );
  }
}
