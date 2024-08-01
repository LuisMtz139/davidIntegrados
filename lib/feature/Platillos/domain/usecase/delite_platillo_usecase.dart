

import '../repository/platillos_repository.dart';

class DelitePlatilloUsecase{
    PlatillosRepository platillosRepository;
  DelitePlatilloUsecase(this.platillosRepository);
  Future<void> execute(String id) async {
    try {
      await platillosRepository.deletePlatillo(id);
    } catch (e) {
      print('error pa $e');
      throw e;
    }
  } 
}