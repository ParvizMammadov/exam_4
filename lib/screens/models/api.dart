import 'package:dio/dio.dart';
import 'package:exam_4/screens/models/user_model.dart';

class GetApi {
  Future<List<UserModel>> getApi() async {
    String url = 'https://jsonplaceholder.typicode.com/todos';
    late final Response responce;
    try {
      responce = await Dio().get(url);
    } on DioException catch (e) {
      return [];
    }

    if (responce.statusCode == 200) {
      return (responce.data as List)
          .map<UserModel>((e) => UserModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
