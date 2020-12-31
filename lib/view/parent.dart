import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handlingChangeStateInChild(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChildWidget(
        active: _active,
        changeState: _handlingChangeStateInChild,
      ),
    );
  }
}

class ChildWidget extends StatelessWidget {
  ChildWidget({Key key, this.active, @required this.changeState})
      : super(key: key);
  final bool active;
  final ValueChanged<bool> changeState;
  void _changingState() {
    changeState(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _changingState,
      child: Container(
        child: Center(
          child: Text(
            active ? 'Active' : 'Inactive',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: active ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
