import Sort "QuickSort";
import Array "mo:base/Array";
import List "mo:base/List";

actor {
    public query func qsort(arr: [Int]): async [Int] {
        let result: [var Int] = Array.thaw(arr);
        Sort.quicksort(result);
        Array.freeze(result)
    };
    
    public query func qsortUsingList(arr: [Int]): async [Int] {
        let list: List.List<Int> = List.fromArray(arr);
        List.toArray(Sort.quicksortList(list))
    }
}