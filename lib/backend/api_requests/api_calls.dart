import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class FbiWantedCall {
  static Future<ApiCallResponse> call({
    int? page = 1,
    String? title = '',
    String? subject = '',
    String? nationality = '',
    String? race = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'fbi wanted',
      apiUrl: 'https://vigilant-api-a2xyukeyka-uc.a.run.app/fbi/getallwanted',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'page': page,
        'title': title,
        'subject': subject,
        'nationality': nationality,
        'race': race,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic wantedList(dynamic response) => getJsonField(
        response,
        r'''$.wantedList''',
        true,
      );
  static dynamic totalRecordsFBI(dynamic response) => getJsonField(
        response,
        r'''$.totalRecords''',
      );
}

class InterpolNoticesCall {
  static Future<ApiCallResponse> call({
    int? page = 1,
    String? nameForename = '',
    String? nationalities = '',
    String? charge = '',
    String? issuingCountry = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'interpol notices',
      apiUrl:
          'https://vigilant-api-a2xyukeyka-uc.a.run.app/interpol/getallnotices',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'page': page,
        'nameForename': nameForename,
        'nationalities': nationalities,
        'charge': charge,
        'issuingCountry': issuingCountry,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class LoginCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{"username":"${username}", "password":"${password}" }''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl: 'https://vigilant-api-a2xyukeyka-uc.a.run.app/Account/Login',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class RegisterCall {
  static Future<ApiCallResponse> call({
    String? username = '',
    String? fullName = '',
    String? password = '',
    String? confirmPassword = '',
  }) async {
    final ffApiRequestBody = '''
{
  "fullName": "${fullName}",
  "username": "${username}",
  "password": "${password}",
  "confirmPassword": "${confirmPassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'register',
      apiUrl: 'https://vigilant-api-a2xyukeyka-uc.a.run.app/Account/Register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
