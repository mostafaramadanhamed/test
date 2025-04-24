void main() {
  SortingAlgorithms sortingAlgorithms = SortingAlgorithms();
  sortingAlgorithms._numbers = [9, 6, 8, 7];
  print('Bubble Sort');
  sortingAlgorithms.bubbleSort();
  sortingAlgorithms._numbers = [12, 8, 4, 16, 9, 6];
  print('Selection Sort');
  sortingAlgorithms.selectionSort();
  sortingAlgorithms._numbers = [20, 10, 30, 25, 28];
  print('Insertion Sort');
  sortingAlgorithms.insertionSort();
  sortingAlgorithms._numbers=[67,9,4,52,1];
  print('Merge Sort');
  sortingAlgorithms.mergeSort(sortingAlgorithms._numbers);
  print(sortingAlgorithms._numbers);
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

    }
    print(_numbers);
  }
  //@ Merge Sort
  void mergeSort(List<int> list) {
    if (list.length <= 1) return;

    int mid = list.length ~/ 2;
    List<int> left = list.sublist(0, mid);
    List<int> right = list.sublist(mid);

    mergeSort(left);
    mergeSort(right);

    _merge(list, left, right);
  }

  void _merge(List<int> list, List<int> left, List<int> right) {
    int i = 0, j = 0, k = 0;

    while (i < left.length && j < right.length) {
      if (left[i] <= right[j]) {
        list[k++] = left[i++];
      } else {
        list[k++] = right[j++];
      }
    }

    while (i < left.length) {
      list[k++] = left[i++];
    }

    while (j < right.length) {
      list[k++] = right[j++];
    }
  }

}

