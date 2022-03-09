import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Text "mo:base/Text";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  // Challenge 1 : Write a private function swap that takes 3 parameters : a mutable array , an index j and an index i and returns the same array but where value at index i and index j have been swapped.
  private func swap(mutarr : [var Nat], j : Nat, i : Nat) : async [Nat] {
    assert(j < mutarr.size() and i < mutarr.size());
    let swapHelper = mutarr[j];
    mutarr[j] := mutarr[i];
    mutarr[i] := swapHelper;
    return Array.freeze(mutarr);
  };
// Challenge 2 : Write a function init_count that takes a Nat n and returns an array [Nat] where value is equal to it's corresponding index.
  // Note : init_count(5) -> [0,1,2,3,4].
  // Note 2 : Do not use Array.append.
  public func init_count(n : Nat) : async [Nat] {
    let mutarr : [Nat] = Array.tabulate<Nat>(n, func(i: Nat) : Nat { 
       i
    } ) ;
    return mutarr;
  };
// Challenge 3 : Write a function seven that takes an array [Nat] and returns "Seven is found" if one digit of ANY number is 7. Otherwise this function will return "Seven not found".
  public func seven(arr : [Nat]) : async Text {
    for(number in arr.vals()) {
      if(Text.contains(Nat.toText(number), #text "7")) {
          return "Seven is found";
      }
    };
    return "Seven not found";
  };
// Challenge 4 : Write a function nat_opt_to_nat that takes two parameters : n of type ?Nat and m of type Nat . This function will return the value of n if n is not null and if n is null it will default to the value of m.
  public func nat_opt_to_nat(n : ?Nat, m : Nat) : async Nat {
    switch(n){
      case null m;
      // Case where n is a nat
      case(?n) n;
    };
  };
// Challenge 5 : Write a function day_of_the_week that takes a Nat n and returns a Text value corresponding to the day. If n doesn't correspond to any day it will return null .
  // day_of_the_week (1) -> "Monday".
  // day_of_the_week (7) -> "Sunday".
  // day_of_the_week (12) -> null.
  /* public func day_of_the_week(n : Nat) : async ?Text {
    if (n > 7 or n < 1) {
      return null;
    };
    let days : [Text] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday", null];
    return days[n-1];
  }; */

// Challenge 6 : Write a function populate_array that takes an array [?Nat] and returns an array [Nat] where all null values have been replaced by 0.
  // Note : Do not use a loop.
  let f = func (n : ?Nat) : Nat {
    switch(n){
      case null 0;
      case(?n) n;
    };
  };
  public func populate_array(arr : [?Nat]) : async [Nat] {
    return (Array.map<?Nat, Nat>(arr, f));    
  };
// Challenge 7 : Write a function sum_of_array that takes an array [Nat] and returns the sum of a values in the array.
  // Note : Do not use a loop.
  public func sum_of_array(arr : [Nat]) : async Nat {
    var sum : Nat = 0;
    let sumFunc = func (n : Nat) : Nat {
      sum += n;
      return sum;
    };
    let resultArr = Array.map<Nat, Nat>(arr, sumFunc);    
    return sum;
  };
// Challenge 8 : Write a function squared_array that takes an array [Nat] and returns a new array where each value has been squared.
  // Note : Do not use a loop.
  let squareFunc = func (n : Nat) : Nat {
    return n**2;
  };
  public func squared_array(arr : [Nat]) : async [Nat] {
    return (Array.map<Nat, Nat>(arr, squareFunc));    
  };

// Challenge 9 : Write a function increase_by_index that takes an array [Nat] and returns a new array where each number has been increased by it's corresponding index.
  // Note : increase_by_index [1, 4, 8, 0] -> [1 + 0, 4 + 1 , 8 + 2 , 0 + 3] = [1,5,10,3]
  // Note 2 : Do not use a loop.
  let increaseByIndexFunc = func (n : Nat, i : Nat) : Nat {
    return n + i;
  };
  public func increase_by_index(arr : [Nat]) : async [Nat] {
    return (Array.mapEntries<Nat, Nat>(arr, increaseByIndexFunc));
  };

// Challenge 10 : Write a higher order function contains<A> that takes 3 parameters : an array [A] , a of type A and a function f that takes a tuple of type (A,A) and returns a boolean.
  // This function should return a boolean indicating whether or not a is present in the array.
  private func contains<A>(arr : [A], a : A, f : (A, A) -> Bool) : async Bool {
    let matchFunc = func (n : A) : Bool {
      return f(a, n);
    };
    let filteredArr = Array.filter<A>(arr, matchFunc);
    if (filteredArr.size() > 0) {
      return true;
    } else {
      return false;
    }
  };
  
};
