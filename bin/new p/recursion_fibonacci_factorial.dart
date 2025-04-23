void main(){
  print(sum(5));
  print(factorial(5));
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