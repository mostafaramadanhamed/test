void main(){
Animal animal=Animal();
Dog dog=Dog();
Cat cat =Cat();
Animal dog2=Dog();
Animal cat2=Cat();
animal.makeSound();
dog.makeSound();
cat.makeSound();
dog2.makeSound();
cat2.makeSound();

}
//@ Inheritance
class Animal {
  //@ Polymorphism
  void makeSound(){

  }
}
class Dog extends Animal{
  @override
  void makeSound(){
    print('WaWa');
  }
}

class Cat extends Animal{

  @override
  void makeSound(){
    print('mewo');
  }
}

