import 'package:sazzon/feature/user/domain/repository/user_repository.dart';

import '../../data/models/user_models.dart';

class GetUserUsecase{
  final UserRepository userRepository;
  GetUserUsecase(this.userRepository);
  
  Future<List<userModel>> execute() async{
    try{
      return await userRepository.getorders();
      
    }catch(e){
      print("error en usecase $e");
      rethrow;
    }
  }

}