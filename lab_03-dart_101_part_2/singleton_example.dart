class StorageManager {
  static final StorageManager _singleton = StorageManager._internal();
  static final double _totalSpace = 2048;
  static double _spaceOccupied = 0;

  factory StorageManager() {
    return _singleton;
  }//StorageManager

  static double get freeSpace => _totalSpace - _spaceOccupied;
  
  void store(double space){
    if((freeSpace - space) < 0){
      print('Not enough space!');
    }//if
    else{
      _spaceOccupied += space;
      print('Stored $space MB');
    }//else
  }//space
  @override
  String toString() => "Space: $_spaceOccupied (of $_totalSpace) MB";

  StorageManager._internal();
}//StorageManager

void main(List<String> args) {
  //Here, I'm getting an instance of StorageManager 
  StorageManager sm = StorageManager();

  //Let's use it
  sm.store(1000);
  print(sm); // This will print 'Space: 1000.0 (0f 2048) MB'
  sm.store(500);
  print(sm); // This will print 'Space: 1500.0 (0f 2048) MB'

  //Let's get a new instance of StorageManager
  StorageManager smBis = StorageManager();

  //This will fail since the Singleton pattern is ensuring that smBis is the same as sm
  //thus the storage has not enough space.
  smBis.store(1000);
  print(smBis); // This will print 'Space: 1500.0 (0f 2048) MB'
}//main