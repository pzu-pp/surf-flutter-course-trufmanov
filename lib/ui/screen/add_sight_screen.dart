import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:places/mocks.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/screen/select_sight_type_screen.dart';

/// Экран добавления нового места
class AddSightScreen extends StatefulWidget {
  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _lonController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _latFocusNode = FocusNode();
  final FocusNode _lonFocusNode = FocusNode();
  final FocusNode _detailsFocusNode = FocusNode();

  SightType _sightType;

  bool _testData() {
    double lat = double.tryParse(_latController.text);
    double lon = double.tryParse(_lonController.text);
    return (_sightType != null) &&
        (_nameController.text.length > 0) &&
        (_latController.text.length > 0) &&
        (lat != null) &&
        (lat >= -90) &&
        (lat <= 90) &&
        (_lonController.text.length > 0) &&
        (lon != null) &&
        (lon >= -90) &&
        (lon <= 90);
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 5, bottom: 5),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(10)),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(10)),
    );

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 108,
        title: Text('Новое место'),
        leading: TextButton(
          child: Text(
            'Отмена',
            style: TextStyle(
                color: Colors.grey, fontFamily: "Roboto", fontSize: 20),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        leadingWidth: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 72,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text('Галерея выбора фотографий')),
              ),
              SizedBox(height: 24),
              Text(
                'КАТЕГОРИЯ',
                style: TextStyle(
                    color: Colors.grey, fontFamily: "Roboto", fontSize: 16),
              ),
              SizedBox(height: 12),
              InkWell(
                onTap: () async {
                  SightType selectedValue = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              SelectSightTypeScreen(sightType: _sightType)));
                  setState(() => _sightType = selectedValue);
                  _nameFocusNode.requestFocus();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _sightType == null ? 'Не выбрано' : _sightType.name,
                      style: TextStyle(
                        color: Theme.of(context)
                            .appBarTheme
                            .textTheme
                            .title
                            .color,
                        fontSize: 20,
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Text(
                'НАЗВАНИЕ',
                style: TextStyle(
                    color: Colors.grey, fontFamily: "Roboto", fontSize: 16),
              ),
              SizedBox(height: 12),
              TextField(
                onSubmitted: (String value) => _latFocusNode.requestFocus(),
                onEditingComplete: () => setState(() {}),
                textInputAction: TextInputAction.next,
                controller: _nameController,
                focusNode: _nameFocusNode,
                decoration: inputDecoration,
                style: TextStyle(
                  color: Theme.of(context)
                      .appBarTheme
                      .textTheme
                      .title
                      .color,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ШИРОТА',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Roboto",
                              fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          validator: (String value) {
                            if (value.length == 0) return null;
                            double lon = double.tryParse(value);
                            if ((lon == null) || (lon < -90) || (lon > 90))
                              return 'Ошибка';
                            return null;
                          },
                          onFieldSubmitted: (String value) =>
                              _lonFocusNode.requestFocus(),
                          onEditingComplete: () => setState(() {}),
                          textInputAction: TextInputAction.next,
                          controller: _latController,
                          focusNode: _latFocusNode,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          decoration: inputDecoration,
                          style: TextStyle(
                            color: Theme.of(context)
                                .appBarTheme
                                .textTheme
                                .title
                                .color,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ДОЛГОТА',
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Roboto",
                              fontSize: 16),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.always,
                          validator: (String value) {
                            if (value.length == 0) return null;
                            double lon = double.tryParse(value);
                            if ((lon == null) || (lon < -90) || (lon > 90))
                              return 'Ошибка';
                            return null;
                          },
                          onFieldSubmitted: (String value) =>
                              _detailsFocusNode.requestFocus(),
                          onEditingComplete: () => setState(() {}),
                          textInputAction: TextInputAction.next,
                          controller: _lonController,
                          focusNode: _lonFocusNode,
                          keyboardType: TextInputType.number,
                          decoration: inputDecoration,
                          style: TextStyle(
                            color: Theme.of(context)
                                .appBarTheme
                                .textTheme
                                .title
                                .color,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () => print('"Указать на карте" pressed.'),
                style: TextButton.styleFrom(
                    primary: Theme.of(context).accentColor),
                child: Text(
                  'Указать на карте',
                  style: TextStyle(
                      color: Colors.green, fontFamily: "Roboto", fontSize: 20),
                ),
              ),
              SizedBox(height: 24),
              Text(
                'ОПИСАНИЕ',
                style: TextStyle(
                    color: Colors.grey, fontFamily: "Roboto", fontSize: 16),
              ),
              SizedBox(height: 12),
              TextField(
                textInputAction: TextInputAction.done,
                controller: _detailsController,
                focusNode: _detailsFocusNode,
                maxLines: 5,
                decoration: inputDecoration,
                style: TextStyle(
                  color: Theme.of(context)
                      .appBarTheme
                      .textTheme
                      .title
                      .color,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          height: 48,
          child: RaisedButton(
            onPressed: _testData()
                ? () {
                    mocks.insert(
                        0,
                        Sight(
                            type: sightTypeMocks[0],
                            name: _nameController.text,
                            lat: double.parse(_latController.text),
                            lon: double.parse(_lonController.text),
                            details: _detailsController.text,
                            url:
                                'http://cruiseinform.ru/upload/medialibrary/150/150c113f3a20e9c2dfc39416120ed51b.jpg'));
                    Navigator.of(context).pop();
                  }
                : null,
            color: Colors.green,
            elevation: 0,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text(
              'СОЗДАТЬ',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.normal,
                  fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
