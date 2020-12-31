import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  ///
  ///
  bool _inActive = true;

  void _manageStateInChildWidget(bool callBack) {
    setState(() {
      _inActive = callBack;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChildWidget(
      inActive: _inActive,
      manageState: _manageStateInChildWidget,
    );
  }
}

class ChildWidget extends StatelessWidget {
  ChildWidget({Key key, this.inActive: true, this.manageState})
      : super(key: key);

  final bool inActive;
  final ValueChanged<bool> manageState;

  void changeState() {
    manageState(!inActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeState,
      child: Container(
        child: Center(
          child: Text(
            inActive ? 'Inactive' : 'Active',
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
        ),
        width: 250.0,
        height: 250.0,
        decoration: BoxDecoration(color: inActive ? Colors.red : Colors.green),
      ),
    );
  }
}
