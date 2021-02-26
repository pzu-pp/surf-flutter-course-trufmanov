import 'dart:async';
import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/widgets/sight_image.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/widgets/app_bottom_navigation_bar.dart';
import 'package:places/ui/widgets/search_text_field.dart';
import 'package:places/ui/screen/sight_details_screen.dart';

/// Экран виджет "Хочу посетить"/"Посещенные места"
class SightSearchScreen extends StatefulWidget {
  @override
  _SightSearchScreenState createState() => _SightSearchScreenState();
}

/// Состояние виджета "Хочу посетить"/"Посещенные места"
class _SightSearchScreenState extends State<SightSearchScreen> {
  final TextEditingController _sightSearchController = TextEditingController();
  final FocusNode _sightSearchFocusNode = FocusNode();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 118,
        title: Text('Список интересных мест'),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 52),
          child: SearchTextField(
            controller: _sightSearchController,
            focusNode: _sightSearchFocusNode,
            onSubmitted: (String value) {
              _sightSearchFocusNode.nextFocus();
              setState(() => searchHistory.add(value));
            },
            onChanged: (String value) {
              if (value.substring(value.length - 1) == ' ') {
                Timer(Duration(seconds: 3),
                    () => setState(() => _isLoading = false));
                setState(() => _isLoading = true);
              }
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: _isLoading
            ? Center(
                child: SizedBox(
                  height: 40.0,
                  width: 40.0,
                  child: Theme(
                      data:
                          Theme.of(context).copyWith(accentColor: Colors.grey),
                      child: CircularProgressIndicator()),
                ),
              )
            : (_sightSearchController.text.trim().length == 0
                ? ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: searchHistory.length + 2,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0)
                        return Container(
                          height: 40,
                          child: Text(
                            'Вы искали',
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      if (index == searchHistory.length + 1) {
                        return InkWell(
                          onTap: () => setState(() => searchHistory.clear()),
                          child: Container(
                            height: 32,
                            child: Text(
                              'Очистить историю',
                              style: TextStyle(
                                fontFamily: "Очистить историю",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.green,
                              ),
                            ),
                          ),
                        );
                      }
                      return _SearchHistoryCard(
                        searchHistoryID: index - 1,
                        onTap: (valueID) => setState(() =>
                            _sightSearchController.text =
                                searchHistory[valueID]),
                        onDelete: (valueID) =>
                            setState(() => searchHistory.removeAt(valueID)),
                      );
                    },
                  )
                : (mocks
                            .where((item) =>
                                _sightSearchController.text.trim().length !=
                                    0 &&
                                item.name.toLowerCase().contains(
                                    _sightSearchController.text
                                        .trim()
                                        .toLowerCase()) &&
                                item.distanceInRange())
                            .length ==
                        0
                    ? Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'res/empty_pages/Search.png',
                              ),
                              Text(
                                'Ничего не найдено',
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 24,
                                    color: Colors.grey),
                              ),
                              Text(
                                'Попробуйте изменить параметры\nпоиска.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 16,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: mocks
                              .where((item) =>
                                  _sightSearchController.text.trim().length !=
                                      0 &&
                                  item.name.toLowerCase().contains(
                                      _sightSearchController.text
                                          .trim()
                                          .toLowerCase()))
                              .map((item) => _SearchedSightCard(sight: item))
                              .toList(),
                        ),
                      ))),
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}

class _SearchedSightCard extends StatelessWidget {
  final Sight sight;

  const _SearchedSightCard({Key key, @required this.sight})
      : assert(sight != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SightDetailsScreen(sight: sight))),
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SightImage(url: sight.url),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        sight.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Theme.of(context)
                              .appBarTheme
                              .textTheme
                              .title
                              .color,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        sight.type.name,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}

class _SearchHistoryCard extends StatelessWidget {
  final int searchHistoryID;
  final ValueChanged<int> onDelete;
  final ValueChanged<int> onTap;

  const _SearchHistoryCard(
      {Key key,
      @required this.searchHistoryID,
      @required this.onDelete,
      @required this.onTap})
      : assert(searchHistoryID != null),
        assert(onDelete != null),
        assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => onTap(searchHistoryID),
                  child: Text(
                    searchHistory[searchHistoryID],
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () => onDelete(searchHistoryID),
                child: Icon(
                  Icons.clear,
                  size: 30,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
