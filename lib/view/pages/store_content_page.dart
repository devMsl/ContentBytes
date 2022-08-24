import 'package:content_bytes/utils/context_extension.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../models/content_object.dart';
import '../../utils/database_helper.dart';
import '../../utils/database_services.dart';
import '../../utils/validator.dart';
import '../widgets/card_widget.dart';
import '../widgets/icon_button_widget.dart';
import '../widgets/my_box_widget.dart';
import '../widgets/text_button_widget.dart';
import '../widgets/text_field_widget.dart';

class AddNewFeedPage extends StatefulWidget {
  const AddNewFeedPage({Key? key}) : super(key: key);

  @override
  State<AddNewFeedPage> createState() => _AddNewFeedPageState();
}

class _AddNewFeedPageState extends State<AddNewFeedPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController photoUrlController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;

  final _formKey = GlobalKey<FormState>();

  bool insertSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Content'),
        leading: IconButtonWidget(iconData: Icons.arrow_back_sharp, onTap: () => Navigator.of(context).pop(insertSuccess)),
      ),
      body: SingleChildScrollView(
        child: CardWidget(
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldWidget(controller: nameController, name: 'Name'),
                      MyBoxWidget(),
                      TextFieldWidget(
                        controller: bodyController,
                        name: 'Body',
                        maxLines: 8,
                      ),
                      MyBoxWidget(),
                      TextFieldWidget(
                        controller: photoUrlController,
                        name: 'Photo Path',
                        isRequired: false,
                        maxLines: 2,
                        validator: () {
                          if (photoUrlController.text.isNotEmpty) {
                            Validation.url(photoUrlController.text);
                          }
                        },
                      ),
                    ],
                  )),
              MyBoxWidget(
                height: 30,
              ),
              TextBtnWidget(
                  name: 'Save',
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      ContentObject contentObject = ContentObject(name: nameController.text, body: bodyController.text, photo: photoUrlController.text);
                      DatabaseServices().insertItem(contentObject.toMap(), tableContent).then((value) => context.back(true));
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    bodyController.dispose();
    photoUrlController.dispose();
    super.dispose();
  }
}
