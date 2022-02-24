import Nat "mo:base/Nat";
import Array "mo:base/Array";

func quicksort(arr: [var Int]): () {
    func swap(x: Nat, y: Nat): () {
        if (x != y) {
            let temp = arr[x];
            arr[x] := arr[y];
            arr[y] := temp;
        };
    };

    func sortIn(from: Nat, to: Nat): () {
        if (from + 1 < to) {
            var l: Nat = from;
            var r: Nat = to - 1;
            while (l < r) {
                while (l < r and arr[r] > arr[from]) { r -= 1; };
                while (l < r and arr[l] <= arr[from]) { l += 1; };
                swap(l, r);
            };
            swap(from, l);
            sortIn(from, l);
            sortIn(l + 1, to);
        }
    };

    sortIn(0, arr.size());
};

actor {
    public func qsort(arr: [Int]): async [Int] {
        let result: [var Int] = Array.thaw(arr);
        quicksort(result);
        Array.freeze(result)
    }
}