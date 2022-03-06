import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Prim "mo:⛔";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

// Challenge 1 : Write a function add that takes two natural numbers n and m and returns the sum.
  public func add(n: Nat, m: Nat) : async Nat {
    return n + m;
  };

// Challenge 2 : Write a function square that takes a natural number n and returns the area of a square of length n.
  public func square(n: Nat) : async Nat {
    return n * n;
  };

// Challenge 3 : Write a function days_to_second that takes a number of days n and returns the number of seconds.
  public func days_to_second(n: Nat) : async Nat {
    return n * 24 * 60 * 60;
  };

// Challenge 4 : Write two functions increment_counter & clear_counter .
  // increment_counter returns the incremented value of counter by n.
  var counter : Nat = 0;
  public func increment_counter(n: Nat) : async Nat {
    counter += n;
    return counter;
  };
  // clear_counter sets the value of counter to 0.
  public func clear_counter() : async () {
    counter := 0;
  };

// Challenge 5 : Write a function divide that takes two natural numbers n and m and returns a boolean indicating if y divides x.
  public func divide(n: Nat, m: Nat) : async Bool {
    return n % m == 0;
  };

// Challenge 6 : Write a function is_even that takes a natural number n and returns a boolean indicating if n is even.
  public func is_even(n: Nat) : async Bool {
    return n % 2 == 0;
  };

// Challenge 7 : Write a function sum_of_array that takes an array of natural numbers and returns the sum. This function will returns 0 if the array is empty.
  // call: dfx canister call day_1 sum_of_array '(vec {10; 5; 50; 55})'
  public func sum_of_array(numbers: [Nat]) : async Nat {
    var counter: Nat = 0;
    for (number in numbers.vals()){
      counter += number;
    };
    // let payload: Nat = Array.map<Nat, Nat>(func x: Nat { x + counter }, numbers: [Nat]);
    return counter;
  };

// Challenge 8 : Write a function maximum that takes an array of natural numbers and returns the maximum value in the array. This function will returns 0 if the array is empty.
  public func maximum(numbers: [Nat]) : async Nat {
    var maximum: Nat = 0;
    for (number in numbers.vals()){
      if (number > maximum) {
        maximum := number;
      }
    };
    return maximum;
  };

// Challenge 9 : Write a function remove_from_array that takes 2 parameters : an array of natural numbers and a natural number n and returns a new array where all occurences of n have been removed (order should remain unchanged).
  public func remove_from_array(numbers: [Nat], n: Nat) : async [Nat] {
    return Array.filter(numbers, func(val: Nat) : Bool { n != val });
  };

// Challenge 10 :
  // Watch this video on selection sort.
  // Implement a function selection_sort that takes an array of natural numbers and returns the sorted array .
  public func selection_sort(numbers: [Nat]) : async [Nat] {
    if (numbers.size() < 2) return numbers;
    var sorted_numbers : [var Nat] = Prim.Array_init<Nat>(numbers.size(), numbers[0]);
    for (k in sorted_numbers.keys()) {
      sorted_numbers[k] := numbers[k];
    };
    var replace_helper = 0;
    for (i in Iter.range(0, sorted_numbers.size() - 2)) {
      var index_current_min = i;
      for (j in Iter.range(i+1, sorted_numbers.size() - 1)) {
        if (sorted_numbers[i] > sorted_numbers[j]) {
          index_current_min := j;
        }        
      };
      if (index_current_min != i) {
        replace_helper := sorted_numbers[i];
        sorted_numbers[i] := sorted_numbers[index_current_min];
        sorted_numbers[index_current_min] := replace_helper;   
      }
    };
    return Prim.Array_tabulate<Nat>(sorted_numbers.size(), func (l : Nat) : Nat {
      sorted_numbers[l];
    });
  };


};
