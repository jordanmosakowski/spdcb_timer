import 'package:spdcb_timer_new/storage/storage_io.dart' if(dart.library.html) 'package:spdcb_timer_new/storage/storage_web.dart';

class Storage{
  StorageInterface interface = StorageInterface();
  Future<void> writeData(String location,String data) async{
    interface.writeData(location, data);
    return;
  }

  Future<String> readData(String location) async{
    return interface.readData(location);
  }
}