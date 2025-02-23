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

// @final

// @ interface

// @ sealed

// @ mixin
