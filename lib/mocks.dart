import 'package:places/domain/sight.dart';

// Тестовые данные

final List<SightType> sightTypeMocks = [
  SightType(
    name: 'Прочее',
    image: 'res/sight_types/others.png',
  ),
  SightType(
    name: 'Памятники',
    image: 'res/sight_types/particular place.png',
  ),
  SightType(
    name: 'Музеи',
    image: 'res/sight_types/museum.png',
  ),
  SightType(
    name: 'Природа',
    image: 'res/sight_types/park.png',
  ),
];

final List<Sight> mocks = [
  Sight(
    name: 'Памятник "Мирный атом"',
    lat: 47.51984200,
    lon: 42.20454200,
    url:
        'http://www.openarium.ru/%D1%84%D0%BE%D1%82%D0%BE/%D1%80%D0%BE%D1%81%D1%81%D0%B8%D1%8F/%D0%B2%D0%BE%D0%BB%D0%B3%D0%BE%D0%B4%D0%BE%D0%BD%D1%81%D0%BA/%D0%BF%D0%B0%D0%BC%D1%8F%D1%82%D0%BD%D0%B8%D0%BA-%D0%BC%D0%B8%D1%80%D0%BD%D1%8B%D0%B9-%D0%B0%D1%82%D0%BE%D0%BC.jpg',
    details:
        'Памятник "Мирный атом" расположен в центре новой части города, возле здания информационного центра Волгодонской АЭС. Сооружение представляет собой скульптуру орбит элементарных частиц атома, обвитых виноградом. Памятник мирному атому установлен не просто так - город был построен для рабочих завода "Атоммаш" и считался городом атомщиков, также рядом расположена Волгодонская АЭС, поэтому можно сказать, что город обязан своим существованием атомной энергетике. Виноградные грозди, свисающие с орбит частиц атома также символизируют часть истории города - город славится своим виноградом и винами из него, которые неоднократно получали призы на выставках. Памятник был создан под руководством заслуженного художника СССР и сегодня считается символом города.',
    type: sightTypeMocks[1],
    scheduled: '12 фев. 2020',
    info: 'Открыто.',
    state: SightState.visited,
  ),
  Sight(
    name: 'Волгодонской эколого-исторический музей',
    lat: 47.51896900,
    lon: 42.15008200,
    url:
        'http://www.openarium.ru/%D1%84%D0%BE%D1%82%D0%BE/%D1%80%D0%BE%D1%81%D1%81%D0%B8%D1%8F/%D0%B2%D0%BE%D0%BB%D0%B3%D0%BE%D0%B4%D0%BE%D0%BD%D1%81%D0%BA/%D0%B2%D0%BE%D0%BB%D0%B3%D0%BE%D0%B4%D0%BE%D0%BD%D1%81%D0%BA%D0%BE%D0%B9-%D1%8D%D0%BA%D0%BE%D0%BB%D0%BE%D0%B3%D0%BE-%D0%B8%D1%81%D1%82%D0%BE%D1%80%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B8%D0%B9-%D0%BC%D1%83%D0%B7%D0%B5%D0%B9.jpg',
    details:
        'Волгодонский эколого-исторический музей является самым крупным государственным музеем в регионе. Включает в себя 12 экспозиционных залов, посвященных народной культуре и отдельный комплекс казачьего куреня XIX века. Фонд музея насчитывает более 70 тысяч экспонатов с разных стран мира, в том числе палеонтологические и археологические коллекции, собрания живописи, графики, декоративно-прикладного искусства, также документы, фотографии, монеты и редкие книги. Представлены в музее и коллекции иконописи XVI - XX веков, деревянных скульптур, изделий из золота, серебра и фарфора. Посетителям будут интересны и выставки изделий из стекла, выставка боевых реликвий, образцы изделий народной культуры и другие экспозиции.',
    type: sightTypeMocks[2],
    scheduled: '10 фев. 2021',
    info: 'Закрыто до 09:00.',
    state: SightState.scheduled,
  ),
  Sight(
    name: 'Информационный центр Волгодонской АЭС',
    lat: 47.52041200,
    lon: 42.20568200,
    url:
        'http://www.openarium.ru/%D1%84%D0%BE%D1%82%D0%BE/%D1%80%D0%BE%D1%81%D1%81%D0%B8%D1%8F/%D0%B2%D0%BE%D0%BB%D0%B3%D0%BE%D0%B4%D0%BE%D0%BD%D1%81%D0%BA/%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D1%8B%D0%B9-%D1%86%D0%B5%D0%BD%D1%82%D1%80-%D0%B2%D0%BE%D0%BB%D0%B3%D0%BE%D0%B4%D0%BE%D0%BD%D1%81%D0%BA%D0%BE%D0%B9-%D0%B0%D1%8D%D1%81.jpg',
    details:
        'Информационный центр Волгодонской АЭС был создан для осведомления населения, обмена мнениями и проведения различных семинаров, форумов, конференций и презентаций о работе станции. Располагается центр в новом здании, его презентация была выполнена профессиональными дизайнерами и соответствует всем современным требованиями. На территории информационного центра располагается выставочный комплекс, который является популярным местом для экскурсий у школьников, студентов и работников различных учреждений. В экспозициях комплекса представлены модели самой станции, ее реактора и других элементов.',
    type: sightTypeMocks[0],
    scheduled: '15 фев. 2021',
    info: 'Закрыто до 10:00.',
    state: SightState.scheduled,
  ),
  Sight(
    name: 'Мемориальный комплекс "Курган казачьей славы"',
    lat: 47.512928,
    lon: 42.183677,
    url:
        'https://tur-ray.ru/wp-content/uploads/2020/01/kurgan-kazachey-slavy.jpg',
    details:
        'Красивый памятный объект этот был открыт у берегов Сухо-Соленовской балки немногим более 10 лет назад – в 2008 г. Его авторами выступили писатель В. Карпенко и скульптор Е. Дердиященко. Мемориальная композиция эта являет собой собрание нескольких памятников, в том числе Бакланову, о котором мы расскажем отдельно ниже, и собственно насыпной курган, возвышающийся на 10 м и как бы разбитый на две части.',
    type: sightTypeMocks[1],
    scheduled: '20 фев. 2020',
    info: 'Открыто.',
    state: SightState.visited,
  ),
  Sight(
    name: 'Цимлянское водохранилище',
    lat: 47.655945,
    lon: 42.275105,
    url:
        'https://tur-ray.ru/wp-content/uploads/2020/01/tsimlyanskoe-vodohranilische.jpg',
    details:
        'Один из самых больших водоемов, созданных руками человека. Водохранилище стало своеобразным перекрестком для десятка рек, богатых рыбой, и властелином близлежащих полей. Гигантская чаша поит землю и более трёх миллионов жителей. Отсюда же по проводам течет электрический ток с одной из важнейших в стране ГЭС. Творение советских строителей повлияло даже на местный климат: теперь зимние холода здесь приходят позже и долго не уступают место теплой весне.',
    type: sightTypeMocks[3],
    scheduled: '25 фев. 2020',
    info: 'Открыто.',
    state: SightState.visited,
  ),
];
