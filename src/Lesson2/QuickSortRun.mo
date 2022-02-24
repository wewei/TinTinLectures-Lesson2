import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Sort "QuickSort";

let arr: [var Int] = Array.thaw([3, 1, 4, 1, 5, 9, 2, 6]);
Sort.quicksort(arr);
Debug.print(debug_show(arr));

