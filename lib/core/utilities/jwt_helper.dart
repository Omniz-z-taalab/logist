import 'dart:convert';

class JWTHelper {
  static Map<String, dynamic> parseJwt(String token) {
    final List<String> parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final String payload = _decodeBase64(parts[1]);
    final dynamic payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  static String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }
    return utf8.decode(base64Url.decode(output));
  }
}
