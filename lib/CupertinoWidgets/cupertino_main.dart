import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoMain extends StatelessWidget {
  const CupertinoMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<IconData> listIcons = [
      CupertinoIcons.zoom_in,
      CupertinoIcons.zoom_out,
      CupertinoIcons.add_circled_solid,
      CupertinoIcons.airplane,
      CupertinoIcons.ant_circle_fill,
      CupertinoIcons.alarm_fill,
      CupertinoIcons.antenna_radiowaves_left_right,
      CupertinoIcons.bag_badge_plus,
      CupertinoIcons.xmark_octagon_fill,
      CupertinoIcons.sort_up_circle_fill,
      CupertinoIcons.shopping_cart,
      CupertinoIcons.square_favorites_alt_fill,
      CupertinoIcons.memories_badge_minus,
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cupertino'),
          centerTitle: true,
          backgroundColor: Colors.purpleAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                CupertinoButton(
                  child: Text('Cupertino Button'),
                  onPressed: () {},
                  color: Colors.purple,
                ),
                const SizedBox(height: 10),
                CupertinoTextField(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Colors.red),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.white, Colors.black38, Colors.white]),
                  ),
                  placeholder: 'Cupertino TextField',
                  placeholderStyle: TextStyle(color: Colors.black87),
                  prefix: Icon(
                    Icons.text_fields_outlined,
                    color: Colors.black,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 5.0),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: CupertinoDatePicker(onDateTimeChanged: (date) {}),
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listIcons.length,
                      itemBuilder: (_, index) =>
                          CupertinoIconItem(icon: listIcons[index])),
                ),
                CupertinoSlider(
                    min: 10, max: 100, value: 30, onChanged: (value) {}),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  width: double.infinity,
                  height: 100,
                  child: CupertinoPicker(
                    looping: true,
                    itemExtent: 50,
                    onSelectedItemChanged: (item) {},
                    children: [
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                    ],
                  ),
                ),
                CupertinoActionSheet(
                  title: Text('Cupertino Action Sheet'),
                  message:
                      Text('Probando widgets de cupertino ando, aguante Barca'),
                  actions: [
                    CupertinoButton.filled(
                      child: Icon(CupertinoIcons.waveform_path_badge_minus),
                      onPressed: () {},
                    ),
                    CupertinoSwitch(
                      onChanged: (bool value) {},
                      value: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CupertinoIconItem extends StatelessWidget {
  const CupertinoIconItem({Key key, @required this.icon}) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8.0),
        Icon(
          icon,
          color: Colors.black,
          size: 30,
        ),
      ],
    );
  }
}
