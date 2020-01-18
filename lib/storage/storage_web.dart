import 'local_storage.dart' as localStorage;

class StorageInterface{

  Future<void> writeData(String location,String data) async{
    localStorage.setItem(location, data);
    return;
  }

  Future<String> readData(String location) async{
    return localStorage.getItem(location);
  }
}