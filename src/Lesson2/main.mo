import Sort "QuickSort";
import Array "mo:base/Array";

actor {
    public func qsort(arr: [Int]): async [Int] {
        let result: [var Int] = Array.thaw(arr);
        Sort.quicksort(result);
        Array.freeze(result)
    }
}