import 'dart:convert';

import 'package:http/http.dart' as http;

class AddCategoryController {
  sendData(String root, String categoryName, String categoryImage) {
    // http.post("https://chatbot-lpw.firebaseio.com/category/$root.json",
    //     body: json.encode({
    //       'categoryName': categoryName,
    //       'categoryImage': categoryImage,
    //     }));
  }
}
