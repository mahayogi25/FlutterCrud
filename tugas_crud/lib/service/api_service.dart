import 'package:tugas_crud/service/user_service.dart';

final UserApiService _siswaService = UserApiService();

class ApiService{
  
  static UserApiService get userService => _siswaService;

}