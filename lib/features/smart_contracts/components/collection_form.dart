import 'package:flutter/material.dart';
import 'sc_creator/common/file_selector.dart';

class CollectionForm extends StatelessWidget {
  const CollectionForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(label: Text("Collection Name")),
              ),
            ),
            Expanded(
              child: FileSelector(
                transparentBackground: true,
                title: "Collection Thumbnail",
                onChange: (val) {},
              ),
            ),
          ],
        ),
        TextFormField(
          decoration: const InputDecoration(
            label: Text("Collection Description"),
          ),
          minLines: 2,
          maxLines: 4,
          maxLength: 1000,
        ),
      ],
    );
  }
}
