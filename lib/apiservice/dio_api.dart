import 'dart:convert';
import 'dart:io';

import 'package:arshad_dev/apiservice/api.dart';
import 'package:arshad_dev/storage/storage_service.dart';
import 'package:dio/dio.dart';

class DioApi implements API {
  StorageService storageService = StorageService();

  // Future<LoginResponseModel> login(
  //     {required userName, required passWord}) async {
  //   String basicAuth =
  //       'Basic ${base64Encode(utf8.encode('$userName:$passWord'))}';

  //   Map<String, dynamic> headerMap = storageService.apiHeaders();
  //   storageService.write(Constants.basicAuth, basicAuth);

  //   headerMap.putIfAbsent("Authorization", () => basicAuth);
  //   const Map<String, dynamic> queryParams = {
  //     "get_full_session": true,
  //   };

  //   try {
  //     final response = await DioHelper.dio!.get(
  //       '${Constants.baseUrl}${Constants.initSession}',
  //       queryParameters: queryParams,
  //       options: Options(
  //         headers: headerMap,
  //         validateStatus: (status) => status! < 500,
  //       ),
  //     );
  //     if (response.data == null) {
  //       throw ErrorResponse(
  //         statusMessage: "No response from server.",
  //         statusCode: HttpStatus.internalServerError,
  //       );
  //     }

  //     if (response.statusCode == HttpStatus.ok) {
  //       return LoginResponseModel.fromJson(response.data);
  //     } else if (response.statusCode == HttpStatus.unauthorized) {
  //       return LoginResponseModel.fromJson(response.data);
  //     } else {
  //       throw ErrorResponse(
  //         statusMessage: response.data,
  //         statusCode: response.statusCode,
  //       );
  //     }
  //   } catch (e) {
  //     if (e is DioError) {
  //       final error = e.error;

  //       if (error is SocketException) {
  //         throw ErrorResponse(
  //           statusMessage:
  //               e.response?.data["error"]["message"].toString() ?? e.message,
  //           userMessage:
  //               e.response?.data["error"]["details"].toString() ?? e.message,
  //           statusCode:
  //               e.response?.statusCode ?? HttpStatus.internalServerError,
  //         );
  //       }
  //       if (error is HandshakeException) {
  //         throw ErrorResponse(
  //           statusCode: HttpStatus.serviceUnavailable,
  //           statusMessage:
  //               "Cannot connect securely to the server. Please ensure that the server has a valid SSL connection.",
  //         );
  //       }
  //       throw ErrorResponse(
  //         statusMessage:
  //             e.response?.data["error"]["message"].toString() ?? e.message,
  //         userMessage:
  //             e.response?.data["error"]["details"].toString() ?? e.message,
  //         statusCode: e.response?.statusCode ?? HttpStatus.internalServerError,
  //       );
  //     }
  //     rethrow;
  //   }
  // }
}
