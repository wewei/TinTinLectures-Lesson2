import Int "mo:base/Int";
import Order "mo:base/Order";
import List "mo:base/List";

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

  // The functional quicksort for List
  public func genericSortList<A>(list: List.List<A>, cmp: (A, A) -> Order.Order): List.List<A> {
    switch list {
      case null { null };
      case (?(h, t)) {
        let (listR, listL)  = List.partition<A>(t, func (x: A): Bool = Order.isGreater(cmp(x, h)));
        List.append<A>(
          genericSortList<A>(listL, cmp),
          ?(h, genericSortList<A>(listR, cmp))
        )
      };
    }
  };

  // The functional quicksort for List<Int>
  public func quicksortList<A>(list: List.List<Int>): List.List<Int> {
    genericSortList(list, Int.compare);
  };
};
