void main() {
  SortingAlgorithms sortingAlgorithms = SortingAlgorithms();
  sortingAlgorithms._numbers = [9, 6, 8, 7];
  sortingAlgorithms.bubbleSort();
  sortingAlgorithms._numbers = [12, 8, 4, 16, 9, 6];
  sortingAlgorithms.selectionSort();
  sortingAlgorithms._numbers = [20, 10, 30, 25, 28];
  sortingAlgorithms.insertionSort();
}

class SortingAlgorithms<T> {
  List<int> _numbers = [];
  void bubbleSort() {
    if (_numbers.isEmpty) {
      throw StateError("Empty List");
    } else {
      for (int i = 0; i < _numbers.length - 1; i++) {
        bool isSorted = false;
        for (int j = 0; j < _numbers.length - i - 1; j++) {
          if (_numbers[j] > _numbers[j + 1]) {
            int temp = _numbers[j];
            _numbers[j] = _numbers[j + 1];
            _numbers[j + 1] = temp;
            isSorted = true;
            print('Bubble Sort $i:  $_numbers');
          }
        }
        if (!isSorted) {
          break;
        }
      }
    }
    print(_numbers);
  }

  void selectionSort() {
    for (int i = 0; i < _numbers.length - 1; i++) {
      int minIndex = i;
      for (int j = i + 1; j < _numbers.length; j++) {
        if (_numbers[j] < _numbers[minIndex]) {
          minIndex = j;
        }
      }
      int temp = _numbers[minIndex];
      _numbers[minIndex] = _numbers[i];
      _numbers[i] = temp;
      print("Selection Sort $i :$_numbers");
    }
    print(_numbers);
  }

  void insertionSort() {
    for (int i = 1; i < _numbers.length; i++) {
      int key = _numbers[i];
      int j = i - 1;
      while (j >= 0 && _numbers[j] > key) {
        _numbers[j + 1] = _numbers[j];
        j = j - 1;
      }
      _numbers[j + 1] = key;
      print('Insertion Sort $i : $_numbers');
    }
    print(_numbers);
  }
}
