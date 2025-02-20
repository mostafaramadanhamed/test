// mixin
mixin Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('Playing piano');
    } else if (canConduct) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}
class Performer{}

class Person{
  late String name;
}
mixin class Aggressive{}
mixin Demented{}
class Maestro extends Person with Musical, Aggressive, Demented {
  Maestro(String maestroName) {
     name = maestroName;
    canConduct = true;
  }
}
//Define abstract members in the mixin
// #
// Declaring an abstract method in a mixin forces any type that uses the mixin
// to define the abstract method upon which its behavior depends.
mixin Musician {
  void playInstrument(String instrumentName); // Abstract method.

  void playPiano() {
    playInstrument('Piano');
  }
  void playFlute() {
    playInstrument('Flute');
  }
  void playDum(){
    playInstrument('Dum');
  }
}
class Virtuoso with Musician {
  @override
  void playInstrument(String instrumentName) {
    print('hgd');
  }


}
//The on clause forces any class that uses a mixin to also be a subclass of the type in the on clause.
mixin MusicalPerformer on Musician {
  performerMethod() {
    print('Performing music!');
    super.playDum();
  }
}

//
