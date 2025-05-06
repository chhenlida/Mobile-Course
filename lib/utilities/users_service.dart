
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class UsersService {
  static final UsersService _singleton = UsersService._internal();
  UsersService._internal();
  static UsersService get instance => _singleton;

 
  final String url = "https://6818cae65a4b07b9d1d0de3b.mockapi.io/users";

Future<List<dynamic>> getUsers() async {
   
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return convert.jsonDecode(response.body) as List;
      } else {
        throw Exception('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }

  Future<dynamic> updateUser(String id, Map<String, dynamic> data) async {
   
    try {
      final response = await http.put(
        Uri.parse('$url/$id'),
        headers: {'Content-Type': 'application/json'},
        body: convert.jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return convert.jsonDecode(response.body);
      } else {
        throw Exception('Failed to update user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to update user: $e');
    }
  }

 Future<dynamic> createUser(Map<String, dynamic> data) async {
 
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: convert.jsonEncode(data),
      );
      if (response.statusCode == 201) {
        return convert.jsonDecode(response.body);
      } else {
        throw Exception('Failed to create user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

Future<dynamic> deleteUser(String id) async {
  
    try {
      final response = await http.delete(Uri.parse('$url/$id'));
      if (response.statusCode == 200) {
        return convert.jsonDecode(response.body);
      } else {
        throw Exception('Failed to delete user: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to delete user: $e');
    }
  }
}
