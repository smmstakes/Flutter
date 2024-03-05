# Flutter/Dart More Essentials 

## Lists

### List Properties

- `length` - returns the number of elements in the list
- `reversed` - returns an iterable object representing the list in reverse order
- `isEmpty` - returns true if the list is empty

### List Methods

- `add()` - adds an element to the end of the list
- `insert()` - inserts an element at a given index
- `remove()` - removes the first occourence of a given element
- `clear()` - removes all elements from the list
- `join()` - converts all elements of a list to a string and concatenates them
- `map()` - returns a **new list with the results of a function applied to each element**
- `where()` - returns a **new list with all elements that satisfy the given condition**
- `any()` - returns true if **at least one element satisfies** the given condition
- `reduce()` - applies a function to each element of the list to **reduce it to a single value**

#### Example

```dart
void main() {
    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    
    numbers.add(11);  // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    numbers.insert(0, 0); // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    numbers.remove(0);    // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    
    numbers.join(', ');  // '1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11'
    numbers.map((number) => number * 2);  // [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22]
    numbers.where((number) => number.isEven);  // [2, 4, 6, 8, 10]

    numbers.any((number) => number > 10);  // true
    numbers.reduce((value, element) => value + element);  // 66
    numbers.clear();  // []
    
}
```
