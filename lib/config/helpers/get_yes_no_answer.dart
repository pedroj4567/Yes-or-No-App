import 'package:yes_or_no_app/domain/entities/message.dart';
import 'package:dio/dio.dart';
import 'package:yes_or_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');
    return YesNoModel.fromJsonToMap(response.data).toMessageEntity();
  }
}
