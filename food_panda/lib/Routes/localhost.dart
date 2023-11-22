import 'package:food_panda/utils/app_constants.dart';
import 'package:http/http.dart' as http;

Future<void> checkLocalhostConnection() async {
  final url = Uri.parse(AppConstants.BASE_URL);

  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // Connection successful, you can proceed with your app logic.
      print(
          "Connected to ${AppConstants.BASE_URL}");
    } else {
      print("Failed to connect to ");
    }
  } catch (e) {
    print("Error connecting to localhost: $e");
  }
}
