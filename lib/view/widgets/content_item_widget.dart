import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'card_widget.dart';
import 'my_box_widget.dart';

class ContentItemWidget extends StatelessWidget {
  final String name;
  final String body;
  final String? photo;
  ContentItemWidget({required this.name, required this.body, this.photo});

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      pa: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: photo == null || photo == ''
                  ? Container()
                  : CachedNetworkImage(
                      maxWidthDiskCache: 500,
                      maxHeightDiskCache: 500,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      imageUrl: photo ?? '',
                      errorWidget: (context, str, err) {
                        return const Icon(
                          Icons.photo,
                          size: 100,
                        );
                      },
                      placeholder: (context, str) {
                        return const Center(
                          child: Text("..."),
                        );
                      },
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                MyBoxWidget(),
                Text(
                  body,
                ),
                MyBoxWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
