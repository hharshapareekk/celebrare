import 'package:celebrare__task/datas.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class EditingPage extends StatefulWidget {
  const EditingPage({Key? key}) : super(key: key);

  @override
  State<EditingPage> createState() => _EditingPageState();
}

class _EditingPageState extends State<EditingPage> {
  String editingText = ''; // Initialize editingText here
  double fontSize = 16.0; // Initial font size
  String fontFamily = 'Arizonia';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // UNDO
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blue,
              child: Center(child: Text('UNDO')),
            ),
          ),

          // REDO
          Container(
            height: 100,
            width: 100,
            color: Colors.blue,
            child: Center(child: Text('REDO')),
          ),
          SizedBox(
            width: 150,
          ),

          // EDIT BOX
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 400,
                  width: 400,
                  color: Colors.blue,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    initialValue: editingText,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Text Here',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8.0), // Add padding for better visibility
                      hintStyle: TextStyle(fontSize: fontSize,fontFamily: fontFamily), // Set font size
                    ),
                    onChanged: (String value) {
                      setState(() {
                        editingText = value;
                      });
                    },
                    style: TextStyle(fontSize: fontSize), // Set font size
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100,
          ),

          Column(
            children: [
              SizedBox(
                height: 40,
              ),

              // FONT
              Center(
                child: Container(
                  height: 40,
                  color: Colors.blue,
                  width: 200,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Select Font',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: fonts
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                          fontFamily = 'Oswald';
                        });
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),

              // SIZE
              Container(
                height: 80, // Adjusted height to accommodate the text widget
                color: Colors.blue,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              setState(() {
                                if(fontSize>=2)
                                {
                                  fontSize -= 2;
                                }
                                 // Decrease font size by 2
                              });
                            },
                          ),
                        ),
                        Center(child: Text('Size: $fontSize')), // Display current font size
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                fontSize += 2; // Increase font size by 2
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 40,
              ),

              // ADD TEXT
              Center(
                child: Container(
                  height: 40,
                  color: Colors.blue,
                  width: 200,
                  child: Row(children: [
                    Center(child: Text('   Add Text Box')),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.add_box),
                    )
                  ]),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
