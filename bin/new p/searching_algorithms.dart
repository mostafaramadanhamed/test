void main(){
List<int> numbers=[1,2,3,4,5,6,7,8,9,10];
print(linearSearch(numbers, 3));
print(binarySearch(numbers, 5));
}
//@ Linear Search
int linearSearch(List<int> numbers, int target)
{
for (int i = 0; i < numbers.length; i++) {
  if (numbers[i] == target) {
    return i;
  }
}
return -1;
}
