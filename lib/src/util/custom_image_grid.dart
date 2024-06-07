import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

import '../../global_providers.dart';
import '../constants/colors.dart';
import 'custom_dotted_container.dart';
import 'image_picker/image_picker.dart';

class CustomImageGrid extends ConsumerStatefulWidget {
  const CustomImageGrid(
      {this.hintText = "Add photo", this.length = 6,super.key});

  final String hintText;
  final int length;

  @override
  ConsumerState<CustomImageGrid> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends ConsumerState<CustomImageGrid> {

  final List<File> _pickedImages = [];
  Future<void> chooseImage({required bool isCamera}) async {
    File? pickedFile;
    if (isCamera) {
      pickedFile = await ref.read(mediaProvider).captureMedia();
    } else {
      pickedFile = await ref.read(mediaProvider).pickImage();
    }
    if (pickedFile != null) {
      _pickedImages.add(pickedFile);
      ref.read(pickedImageProvider.notifier).state = _pickedImages;

      // setToProviders(_pickedImages);
      setState(() {});
    }
  }

  Future<void> chooseMultiImage({required int imageCount}) async {
    final pickedFile = await ref
        .read(mediaProvider)
        .pickMultiImage(count: imageCount, context: context);

    if (pickedFile.isNotEmpty) {
      _pickedImages.addAll(pickedFile);
      ref.read(pickedImageProvider.notifier).state = _pickedImages;
      setState(() {});
    }
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
        decoration: InputDecoration(
          labelText: widget.hintText != "Add photo"
              ? widget.hintText
              : '${widget.hintText} (${_pickedImages.length}/${widget.length})',
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: black400),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: black400),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: orangePrimary),
              borderRadius: BorderRadius.circular(15)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: orangePrimary),
              borderRadius: BorderRadius.circular(15)),
          filled: true,
          fillColor: black100,
          labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500)
        ),
        child: ReorderableGridView.extent(
          shrinkWrap: true,
          maxCrossAxisExtent: 100.h,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 1.0,
          onReorder: (oldImage, newImage) {
            setState(() {
              final _reorderedImage = _pickedImages.removeAt(oldImage);
              _pickedImages.insert(newImage, _reorderedImage);
              ref.read(pickedImageProvider.notifier).state = _pickedImages;
            });
          },
          children: [
            for (final item in _pickedImages)
              SizedBox(
                key: ValueKey(item),
                child: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          item,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 5.w,
                      top: 5.h,
                      child: InkWell(
                        onTap: () {
                          _pickedImages.remove(item);
                          ref.read(pickedImageProvider.notifier).state = _pickedImages;
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: orange100,
                              border: Border.all(color: orange800),
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.close,
                            color: brownColor,
                            size: MediaQuery.of(context).size.height * 0.019,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            if (_pickedImages.length <= (widget.length - 1))
              SizedBox(
                key: const ValueKey('AddImage'),
                child: InkWell(
                  onTap: _pickedImages.length == widget.length
                      ? null
                      : () async {
                    final isCamera = await ref
                        .read(mediaProvider)
                        .chooseSource(context);
                    if (isCamera != null) {
                      if (isCamera) {
                        chooseImage(isCamera: isCamera);
                        setState(() {});
                      } else {
                        final length =
                            widget.length - _pickedImages.length;
                        if (widget.length == 1) {
                          chooseImage(
                            isCamera: false,
                          );
                        } else {
                          chooseMultiImage(imageCount: length);
                        }
                        setState(() {});
                      }
                    }
                  },
                  child: const CustomDottedBox(
                      height: double.infinity,
                      child: Icon(
                        Icons.add,
                        color: orangePrimary,
                      )),
                ),
              ),
          ],
        ));
  }
}