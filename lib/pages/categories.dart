import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import 'package:goodbye_money/types/widgets.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // create some values
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);

  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  // ValueChanged<Color> callback
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CupertinoNavigationBarBackButton(),
        middle: Text(
          "Categories",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        height: double.infinity,
        width: double.infinity,
        transformAlignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              child: CupertinoFormSection.insetGrouped(
                children: List.generate(
                  5,
                  (index) => GestureDetector(
                    // onPanEnd: ,
                    child: DecoratedBox(
                      decoration: BoxDecoration(),
                      child: CupertinoFormRow(
                        prefix: Row(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              margin: EdgeInsets.only(right: 8,),
                              padding: EdgeInsets.all(14),
                              decoration: BoxDecoration(
                                color: pickerColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const Text("Category name", style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        helper: null,
                        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                        child: Container(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              bottom: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // raise the [showDialog] widget
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Pick a color!'),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: pickerColor,
                                onColorChanged: changeColor,
                              ),
                              // Use Material color picker:
                              //
                              // child: MaterialPicker(
                              //   pickerColor: pickerColor,
                              //   onColorChanged: changeColor,
                              //   showLabel: true, // only on portrait mode
                              // ),
                              //
                              // Use Block color picker:
                              //
                              // child: BlockPicker(
                              //   pickerColor: currentColor,
                              //   onColorChanged: changeColor,
                              // ),
                              //
                              // child: MultipleChoiceBlockPicker(
                              //   pickerColors: currentColors,
                              //   onColorsChanged: changeColors,
                              // ),
                            ),
                            actions: <Widget>[
                              CupertinoButton(
                                child: const Text('Got it'),
                                onPressed: () {
                                  setState(() => currentColor = pickerColor);
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        margin: EdgeInsets.only(right: 12),
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                            /*strokeAlign: StrokeAlign.outside*/
                          ),
                          color: pickerColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        child: CupertinoTextField(
                          controller: _textController,
                          placeholder: "Category name",
                          style: TextStyle(color: CupertinoColors.white),
                        ),
                      ),
                    ),
                    Text("B"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
