void main() {
  print(sum(5));
  print(factorial(5));
  for (int i = 0; i < 5; i++) {
    print(fibonacci(i));
  }

}
//@ Recursion
int sum(int number){
  if(number==1) return 1;
  return number+sum(number-1);
}
//@ Recursion - Factorial
int factorial(int number){
  if(number==0) return 1;
  return number*factorial(number-1);
}
//@ Recursion - Fibonacci
int fibonacci(int number){
  if(number==0)return 0;
  if(number==1 || number==2) return 1;
  else{
    return fibonacci(number-1) + fibonacci(number-2);
  }
}