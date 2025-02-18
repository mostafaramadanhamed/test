/**
    Constructors
    Constructors are special functions that create instances of classes.

    Dart implements many types of constructors. Except for default constructors, these functions use the same name as their class.

    Generative constructors: Creates new instances and initializes instance variables.
    Default constructors: Used to create a new instance when a constructor hasn't been specified. It doesn't take arguments and isn't named.
    Named constructors: Clarifies the purpose of a constructor or allows the creation of multiple constructors for the same class.
    Constant constructors: Creates instances as compile-type constants.
    Factory constructors: Either creates a new instance of a subtype or returns an existing instance from cache.
    Redirecting constructor: Forwards calls to another constructor in the same class.
 */
// Generative constructors

//To instantiate a class, use a generative constructor.

class Point {
// Instance variables to hold the coordinates of the point.
double x;
double y;

// Generative constructor with initializing formal parameters:
Point(this.x, this.y);

}