import 'package:flutter/material.dart';

/**
 * In the following example, ChildWidget exports its state to its parent through a callback. 
 * Because ChildWidget doesn’t manage any state, it extends StatelessWidget.

What the ParentWidgetState class does:

    
    
    When the state changes, this method calls setState() to update the UI.

What the ChildWidget class does:

    
    

 */

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  /// Manages the _inActive state for ChildWidget.
  ///
  bool _inActive = true;

  /// Implements _manageStateForChildWidget(), the method called when the box is tapped.
  ///
  void _manageStateForChildWidget(bool newValue) {
    setState(() {
      _inActive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChildWidget(
      inActive: _inActive,
      notifyParent: _manageStateForChildWidget,
    );
  }
}

/// Extends StatelessWidget because all state is handled by its parent, ParentWidget
///
class ChildWidget extends StatelessWidget {
  ChildWidget({Key key, this.inActive = true, this.notifyParent})
      : super(key: key);
  final bool inActive;

  /// When a tap is detected, it notifies the parent.
  ///
  final ValueChanged<bool> notifyParent;
  void manageState() {
    notifyParent(!inActive);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: manageState,
      child: Container(
        child: Center(
          child: Text(
            inActive ? 'Inactive' : 'Active',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.white,
            ),
          ),
        ),
        width: 250.0,
        height: 250.0,
        decoration: BoxDecoration(color: inActive ? Colors.red : Colors.green),
      ),
    );
  }
}
