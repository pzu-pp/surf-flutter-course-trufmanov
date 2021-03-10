import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

/// Экран ознакомительного тура
class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          _currentPage != 2
              ? TextButton(
                  child: Text(
                    'Пропустить',
                    style: TextStyle(
                        color: Colors.green,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                  ),
                  onPressed: () => _pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear),
                )
              : SizedBox.shrink(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) => setState(() => _currentPage = value),
              children: [
                _OnboardingPage(
                  imageName: 'res/tutorial/tutorial_1.png',
                  title: 'Добро пожаловать\nв Путеводитель',
                  subtitle: 'Ищи новые локации и сохраняй\n самые любимые.',
                ),
                _OnboardingPage(
                  imageName: 'res/tutorial/tutorial_2.png',
                  title: 'Построй маршрут\nи отправляйся в путь',
                  subtitle: 'Достигай цели максимально\nбыстро и комфортно.',
                ),
                _OnboardingPage(
                  imageName: 'res/tutorial/tutorial_3.png',
                  title: 'Добавляй места,\nкоторые нашёл сам',
                  subtitle:
                      'Делись самыми интересными\nи помоги нам стать лучше!',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < 3; i++)
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Container(
                    width: _currentPage == i ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      color: _currentPage == i ? Colors.green : Colors.grey,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(
            height: _currentPage == 2 ? 32 : 112,
          )
        ],
      ),
      bottomNavigationBar: _currentPage == 2
          ? Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                height: 48,
                child: RaisedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SightListScreen())),
                  color: Colors.green,
                  elevation: 0,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Text(
                    'НА СТАРТ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                  ),
                ),
              ),
            )
          : SizedBox.shrink(),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final String imageName;
  final String title;
  final String subtitle;

  const _OnboardingPage({
    Key key,
    @required this.imageName,
    @required this.title,
    @required this.subtitle,
  })  : assert(imageName != null),
        assert(title != null),
        assert(subtitle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          imageName,
          height: 98,
          color: Theme.of(context).appBarTheme.textTheme.title.color,
        ),
        SizedBox(
          height: 42,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Theme.of(context).appBarTheme.textTheme.title.color,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 117,
        ),
      ],
    );
  }
}
