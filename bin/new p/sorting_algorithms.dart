void main(){
  SortingAlgorithms sortingAlgorithms=SortingAlgorithms();
  sortingAlgorithms._numbers=[9,6,8,7];
  sortingAlgorithms.bubbleSort();

}

class SortingAlgorithms<T>{
  List<int>_numbers=[];
 void bubbleSort() {
    if (_numbers.isEmpty) {
      throw StateError("Empty List");
    }
    else {
      for(int i=0; i<_numbers.length-1;i++){
        bool isSorted=false;
        for (int j=0; j<_numbers.length-i-1; j++){
          if(_numbers[j]> _numbers[j+1]){
            int temp=_numbers[j];
            _numbers[j]=_numbers[j+1];
            _numbers[j+1]=temp;
            isSorted=true;
            print('$i:  $_numbers');
          }

          }    if(!isSorted){
          break;
        }
      }

    }
    print(_numbers);

 }
}