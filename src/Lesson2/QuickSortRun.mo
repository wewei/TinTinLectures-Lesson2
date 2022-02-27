import Array "mo:base/Array";
import List "mo:base/List";
import Debug "mo:base/Debug";
import Sort "QuickSort";

let arr: [var Int] = Array.thaw([3, 1, 4, 1, 5, 9, 2, 6]);
Sort.quicksort(arr);
Debug.print(debug_show(arr));

let list: List.List<Int> = List.fromArray([3, 1, 4, 1, 5, 9, 2, 6]);
Debug.print(debug_show(Sort.quicksortList(list)));

