import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text('갤러리'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // API 호출
          var response = await http.get(
            Uri.parse(
              'http://121.140.73.79:18000/functions/v1/hello',
            ),
          );

          debugPrint(response.body);

          // http.get(
          //   Uri.parse(
          //     'https://121.140.73.79:18443/functions/v1/hello',
          //   ),
          // ).then((value) {});
        },
        child: const Icon(
          Icons.refresh,
        ),
      ),
      child: const Placeholder(),
    );
  }
}
