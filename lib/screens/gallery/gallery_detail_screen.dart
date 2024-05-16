import 'package:daelim_univ/common/widgets/app_scaffold.dart';
import 'package:daelim_univ/models/gallery_item.dart';
import 'package:daelim_univ/provider/gallery_controller.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryDetailScreen extends StatefulWidget {
  final int? id;

  const GalleryDetailScreen({
    super.key,
    this.id,
  });

  @override
  State<GalleryDetailScreen> createState() => _GalleryDetailScreenState();
}

class _GalleryDetailScreenState extends State<GalleryDetailScreen> {
  int get id => widget.id ?? -1;

  final _controller = Get.find<GalleryController>();

  late final GalleryItemHits? _item;

  @override
  void initState() {
    super.initState();
    _item = _controller.searchById(id);

    Log.green(_item);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      enableDrawer: false,
      appBar: AppBar(
        title: Text(_item!.tags),
      ),
      child: SafeArea(
        child: Column(
          children: [
            //#region 이미지
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Stack(
                children: [
                  //#region 메인 이미지
                  Positioned.fill(
                    child: Hero(
                      tag: _item.id,
                      child: Image.network(
                        _item.largeImageURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //#endregion

                  //#region 이미지 크기
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      child: Text(
                        '${_item.imageWidth}x${_item.imageHeight}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  //#endregion

                  //#region 유저 정보
                  Positioned(
                    left: 5,
                    top: 5,
                    child: Tooltip(
                      message: _item.user,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.yellow,
                            width: 4,
                          ),
                          image: DecorationImage(
                            image: Image.network(
                              _item.userImageURL,
                            ).image,
                          ),
                        ),
                      ),
                    ),
                  ),
                  //#endregion
                ],
              ),
            ),
            //#endregion

            //#region Likes, User Nick
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Like',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      children: [
                        10.widthSpan,
                        TextSpan(
                          text: '${_item.likes}',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //#endregion
          ],
        ),
      ),
    );
  }
}
