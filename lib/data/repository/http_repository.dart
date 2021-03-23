import 'package:dio/dio.dart';

var baseOptions = BaseOptions(
//  baseUrl: 'https://test-backend-flutter.surfstudio.ru',
  connectTimeout: 5000,
  receiveTimeout: 5000,
  sendTimeout: 5000,
  responseType: ResponseType.json,
);

var interceptor = InterceptorsWrapper(
  onRequest: (value) => print('Sent request: ${value.data}.'),
  onResponse: (value) => print('Received response: ${value.data}.'),
  onError: (value) => print('Error: ${value.error}.'),
);

var dio = Dio(baseOptions);

void test() async {
  dio.interceptors.add(interceptor);
  await dio.get('https://jsonplaceholder.typicode.com/users');
}
