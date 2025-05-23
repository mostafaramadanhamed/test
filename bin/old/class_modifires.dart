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
// ? To close the type hierarchy, use the final modifier.
// ? Final classes can be extended or implemented within the same library.
// ? The final modifier encompasses the effects of base, and therefore any subclasses must also be marked base, final, or sealed
final class D {
  void moveForward(int meters) {
    // ...
  }
}
// Can be constructed.
D myD = D();

// ! ERROR: Can't be inherited.
// class DD extends D {
//   int passengers = 4;
//   // ...
// }
//
//  class MoD implements D {
//   ! ERROR: Can't be implemented.
// /  @override
//   void moveForward(int meters) {
//     // ...
//   }


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
// ? To create a known, enumerable set of subtypes, use the sealed modifier.
// ? This allows you to create a switch over those subtypes that is statically ensured to be exhaustive.
sealed class E{

}
// !can't be constructed
// E RT =E();
// Can be extended
class EE extends E {

}
// can be implemented
class MOE implements E {}
// @ Combining modifiers
// ? You can combine some modifiers for layered restrictions. A class declaration can be, in order:

// * (Optional) abstract, describing whether the class can contain abstract members and prevents instantiation.
// * (Optional) One of base, interface, final or sealed, describing restrictions on other libraries subtyping the class.
// * (Optional) mixin, describing whether the declaration can be mixed in.
// * The class keyword itself.

// @ Class modifiers for API maintainers
// ? The mixin modifier on classes
mixin class Both {}

class UseAsMixin with Both {}
class UseAsSuperclass extends Both {}

// * Use interface to prevent users from reusing your class's code while allowing them to re-implement its interface.
// ? Use base to require users to reuse your class's code and ensure every instance of your class's type is an instance of that actual class or a subclass.
// ? Use final to completely prevent a class from being extended.
// ? Use sealed to opt in to exhaustiveness checking on a family of subtypes.