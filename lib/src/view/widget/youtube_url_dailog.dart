import 'package:flutter/material.dart';
import 'package:kisaan_station/src/constants/colors.dart';

import '../../util/text_validation/text_validation.dart';
import '../social/post/widgets/youtube_placeholder.dart';

class YoutubeURLDialog extends StatefulWidget {
  @override
  _YoutubeURLDialogState createState() => _YoutubeURLDialogState();
}

class _YoutubeURLDialogState extends State<YoutubeURLDialog> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final textControllerUrl = TextEditingController();
  int valid = 0;

  @override
  void dispose() {
    valid = 0;
    textControllerUrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: const Icon(
                      Icons.close,
                      color: grey,
                      size: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'Add Youtube Video Link',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) => Validate.youtubeLink(value!),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: Colors.grey[100],
                    hintStyle: const TextStyle(fontSize: 14, color: grey),
                    hintText: 'Add Url...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  controller: textControllerUrl,
                  autofocus: true,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(height: 20.0),
              if (valid == 1)
                YoutubePlaceholder(videoURL: textControllerUrl.text),
              if (valid == 0)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          valid = 1;
                          FocusScope.of(context).unfocus();
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11)),
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: const Text("Validate"),
                  ),
                ),
              if (valid == 1)
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 10, 6, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, textControllerUrl.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11)),
                      minimumSize: const Size(double.infinity, 40),
                    ),
                    child: const Text("Continue"),
                  ),
                ),
              const SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
