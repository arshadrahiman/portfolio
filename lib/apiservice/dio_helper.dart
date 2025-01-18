// import 'package:arshad_dev/utils/constants.dart';
// import 'package:dio/dio.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
// import '../../util/constants.dart';
// import 'package:cookie_jar/cookie_jar.dart';

// class DioHelper {
//   static Dio? dio;
//   static String? cookies;

//   static Future init() async {
//     // var cookieJar = await getCookiePath();
//     dio = Dio(
//       BaseOptions(
//         baseUrl: Constants.baseUrl,
//       ),
//     );
//     dio?.options.connectTimeout = 60 * 1000;
//     dio?.options.receiveTimeout = 60 * 1000;
//     // fetchWithCookies();
//   }

//   static Future initCookies() async {
//     // cookies = await getCookies();
//   }

//   static fetchWithCookies() async {
//     final dio = Dio();
//     final cookieJar = CookieJar();

//     // Attach Cookie Manager to Dio
//     dio.interceptors.add(CookieManager(cookieJar));

//     // Make an HTTP request
//     final response = await dio.get('https://example.com');
//     print("Response: ${response.data}");

//     // Await the cookies for the request
//     final cookie = await cookieJar.loadForRequest(Uri.parse(Constants.baseUrl));
//     print("Cookies: $cookie");

//     // Access a specific cookie
//     final sessionCookie = cookie.firstWhere(
//       (cookie) => cookie.name == 'session_id', // Handle missing cookie
//     );

//     if (sessionCookie != null) {
//       cookies = sessionCookie.value;
//       print("Session Cookie Value: ${sessionCookie.value}");
//     } else {
//       print("Session cookie not found!");
//     }
//   }

//   // static Future<PersistCookieJar> getCookiePath() async {
//   //   Directory appDocDir = await getApplicationSupportDirectory();
//   //   String appDocPath = appDocDir.path;
//   //   return PersistCookieJar(
//   //       ignoreExpires: true, storage: FileStorage(appDocPath));
//   // }
//   //
//   // static Future<String?> getCookies() async {
//   //   var baseUrl = GetStorage().read(Constants.baseUrl)??"";
//   //   var cookieJar = await getCookiePath();
//   //   var cookies = await cookieJar.loadForRequest(Uri.parse(baseUrl));
//   //
//   //   var cookie = CookieManager.getCookies(cookies);
//   //   return cookie;
//   //
//   // }
// }
