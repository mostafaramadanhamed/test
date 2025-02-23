// * class modifiers
// @ No Modifiers
// ? use a class or mixin declaration without a modifier

// @ abstract
// To define a class that doesn't require a full, concrete implementation of its entire interface, use the abstract modifier.

abstract class Vehicle {
  void moveForward(int meters);
}

// ! Error: Can't be constructed.
// Vehicle myVehicle = Vehicle();

// Can be extended.
class Car extends Vehicle {
  int passengers = 4;

  @override
  void moveForward(int meters) {
    // ...
  }
}

// Can be implemented.
class MockVehicle implements Vehicle {
  @override
  void moveForward(int meters) {
    // ...
  }
}

// @ base
// To enforce inheritance of a class or mixin's implementation,
// use the base modifier. A base class disallows implementation outside of its own library.
base class B {
  void moveForward(int meters) {
    // ...
  }
}
B myB = B();

// Can be extended.
// ? child must be same type ( base || final || sealed)
base class BB extends B {
  int passengers = 4;
// ...
}


// !ERROR: Can't be implemented.
// base class MoB implements B {
// /  @override
//   void moveForward() {
//     // ...
//   }
// }
// @final

// @ interface
//? interface modifier. Libraries outside of the interface's own defining library can implement the interface, but not extend it
interface class C {
  void moveForward(int meters) {
    // ...
  }
}
// Can be constructed.
C myc = C();

//! ERROR: Can't be inherited.
class CC extends C {
  int passengers = 4;
// ...
}

// Can be implemented.
class MoC implements C {
  @override
  void moveForward(int meters) {
    // ...
  }
}
 // @ abstract interface
// ? Like an interface class, other libraries can implement, but can't inherit, a pure interface.
// ? Like an abstract class, a pure interface can have abstract members.

// @ sealed

// @ mixin
