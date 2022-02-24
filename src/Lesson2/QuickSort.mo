import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Array "mo:base/Array";
import Order "mo:base/Order";

module {
  /// In place quick sort for mutable array
  public func genericSort<A>(arr: [var A], cmp: (A, A) -> Order.Order): () {
    func swap(x: Nat, y: Nat): () {
      if (x != y) {
        let temp = arr[x];
        arr[x] := arr[y];
        arr[y] := temp;
      };
    };

    func gt(x: Nat, y: Nat): Bool {
      Order.isGreater(cmp(arr[x], arr[y]));
    };

    func sortIn(from: Nat, to: Nat): () {
      if (from + 1 < to) {
        var l: Nat = from;
        var r: Nat = to - 1;
        while (l < r) {
          while (l < r and gt(r, from)) r -= 1;
          while (l < r and not gt(l, from)) l += 1;
          swap(l, r);
        };
        swap(from, l);
        sortIn(from, l);
        sortIn(l + 1, to);
      }
    };

    sortIn(0, arr.size());
  };

  /// The in place quick sort for mutable Int array
  public func quicksort(arr: [var Int]): () {
    genericSort(arr, Int.compare);
  };

}