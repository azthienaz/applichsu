import 'package:flutter/material.dart';
import 'package:applichsu/model/bookmark_model.dart';


class BookmarkWidget extends StatelessWidget {
  const BookmarkWidget({
    super.key,
    required this.bookmarkModel,
    required this.onSelectBookmarkModel,
  });

  final BookmarkModel bookmarkModel;
  final void Function(int index) onSelectBookmarkModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: InkWell(
          onTap: (){
            onSelectBookmarkModel(bookmarkModel.index);
          },
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(
                colors: [
                  Colors.grey,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(child: Image(image: bookmarkModel.image, width: 160)),
                const SizedBox(height: 5),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        bookmarkModel.title,
                        textDirection:  TextDirection.ltr,
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 0),
                      const Icon(Icons.favorite, color: Colors.red),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
