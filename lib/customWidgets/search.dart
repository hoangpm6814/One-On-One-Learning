import 'package:flutter/material.dart';
import 'package:lettutor/constants.dart';

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key key,
    @required this.text,
    @required this.onChanged,
    @required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // const styleActive = TextStyle(color: Colors.black);
    // const styleHint = TextStyle(color: Colors.black54);
    // final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      height: 42,
      // margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // color: Color(0xFF3d3d3d),
        color: Colors.black12,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.search,
            color: Theme.of(context).disabledColor,
          ),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColor,
                  ),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          // hintStyle: style,
          border: InputBorder.none,
        ),
        // style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
