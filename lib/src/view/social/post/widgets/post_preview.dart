import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../constants/colors.dart';


@RoutePage()
class PostImagePreviewerPage extends StatefulWidget {
  const PostImagePreviewerPage({super.key, required this.urls, required this.initialPage});
  final List<String> urls;
  final int initialPage;

  @override
  State<PostImagePreviewerPage> createState() => _PostImagePreviewerPageState();
}

class _PostImagePreviewerPageState extends State<PostImagePreviewerPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,iconTheme: const IconThemeData(color: Colors.white),),
      backgroundColor: Colors.black,
      body: PageView(
        children: [
          for(final url in widget.urls)
            Image.network(
              url,
              fit: BoxFit.fitWidth,
              loadingBuilder: (context, child, loadingProgress){
                if(loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              errorBuilder: (context, obj, st){
                return const Icon(Icons.image_not_supported);
              },

            )

        ],
      ),
    );
  }
}
