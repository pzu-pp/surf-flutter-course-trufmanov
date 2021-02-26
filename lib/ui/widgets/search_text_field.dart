import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  final ValueChanged<String> onChanged;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onSubmitted;

  const SearchTextField({
    Key key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        color: Colors.black12,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
            Icon(
              Icons.search,
              size: 30,
              color: Colors.grey,
            ),

            Expanded(
              child: TextField(
                enabled: widget.controller!=null,
                onSubmitted: (String value)  {if (widget.onSubmitted!= null) widget.onSubmitted(value);},
                onEditingComplete: () {if (widget.onEditingComplete!= null) widget.onEditingComplete();},
                onChanged: (String value) {if (widget.onChanged!= null) widget.onChanged(value);},
                textInputAction: TextInputAction.search,
                controller: widget.controller,
                focusNode: widget.focusNode,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Поиск',
                ),
                style: TextStyle(
                  color: Theme.of(context)
                      .appBarTheme
                      .textTheme
                      .title
                      .color,
                  fontSize: 20,
                ),
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                if (widget.controller!=null) widget.controller.text = '';
              }),
              child: Image.asset(
                'res/clear.png',
                fit: BoxFit.fitWidth,
                height: 30,
                width: 30,
                color: Theme.of(context).appBarTheme.textTheme.title.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
