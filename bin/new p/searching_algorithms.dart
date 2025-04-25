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
//@ Binary Search
int binarySearch(List<int>numbers, int target){
  int low=0;
  int high=numbers.length-1;
  while (low <= high) {
    int mid = (low + (high - low) / 2).toInt() ;

    // Check if x is present at mid
    if (numbers[mid] == target) {
      return mid;
    }

    // If x greater, ignore left half
    if (numbers[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  // If we reach here, then element was not present
  return -1;
}