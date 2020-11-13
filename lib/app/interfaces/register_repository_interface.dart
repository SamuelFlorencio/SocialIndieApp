import '../core/responses/response_defult.dart';

abstract class IregisterRepository {
  Future<DefaultResponse> registerUserData(Map mapUser);
}
