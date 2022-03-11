import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";
import Iter "mo:base/Iter";

actor StableHashMap {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

// Challenge 2 : Create an HashMap called favoriteNumber where the keys are Principal and the value are Nat.
var favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

// Challenge 3 : Write two functions :
  // add_favorite_number that takes n of type Nat and stores this value in the HashMap where the key is the principal of the caller. This function has no return value.
  // show_favorite_number that takes no argument and returns n of type ?Nat, n is the favorite number of the person as defined in the previous function or null if the person hasn't registered.
  public shared(msg) func add_favorite_number1(n : Nat) : async () {
    favoriteNumber.put(msg.caller, n);
    return;
  };

  public shared(msg) func show_favorite_number() : async (?Nat) {
    return(favoriteNumber.get(msg.caller));
  };

// Challenge 4 : Rewrite your function add_favorite_number so that if the caller has already registered his favorite number, the value in memory isn't modified. This function will return a text of type Text that indicates "You've already registered your number" in that case and "You've successfully registered your number" in the other scenario.
  public shared(msg) func add_favorite_number(n : Nat) : async Text {
    switch(favoriteNumber.get(msg.caller)){
      case(null) {
        favoriteNumber.put(msg.caller, n);
        return "You've successfully registered your number";
      };
      case(?l){
        return "You've already registered your number";
      };
    }
  }; 

// Challenge 5 : Write two functions
  // update_favorite_number
  public shared(msg) func update_favorite_number(n : Nat) : async (?Nat) {
    return favoriteNumber.replace(msg.caller, n);
  };
  // delete_favorite_number
  public shared(msg) func delete_favorite_number() : async () {
    favoriteNumber.delete(msg.caller);
    return;
  };

// Challenge 9 : In a new file, copy and paste the functionnalities you've created in challenges 2 to 5. This time the hashmap and all records should be preserved accross upgrades.
  stable var entries : [(Principal, Nat)] = [];

  system func preupgrade() {
      entries := Iter.toArray(favoriteNumber.entries());
  };

  system func postupgrade() {
      favoriteNumber := HashMap.fromIter<Principal, Nat>(entries.vals(), 0, Principal.equal, Principal.hash);
      entries := [];
  };
};
