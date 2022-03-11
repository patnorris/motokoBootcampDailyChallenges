import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";

import Rich "canister:day_5_rich";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

  // Challenge 1 : Write a function is_anonymous that takes no arguments but returns true is the caller is anonymous and false otherwise.
  public shared(msg) func is_anonymous() : async Bool {
    return (msg.caller == Principal.fromText("2vxsx-fae"));
  };
// Challenge 2 : Create an HashMap called favoriteNumber where the keys are Principal and the value are Nat.
let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);

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

// Challenge 6 : Write a function deposit_cycles that allow anyone to deposit cycles into the canister. This function takes no parameter but returns n of type Nat corresponding to the amount of cycles deposited by the call.
  public func deposit_cycles() : async (Nat) {
    if(Cycles.available() < 10_000) {
      return 0;
    };
    let received = Cycles.accept(10000);
    return received;
  };

// Challenge 7 (hard ⚠️) : Write a function withdraw_cycles that takes a parameter n of type Nat corresponding to the number of cycles you want to withdraw from the canister and send it to caller asumming the caller has a callback called deposit_cycles()
  // Note : You need two canisters.
  // Note 2 : Don't do that in production without admin protection or your might be the target of a cycle draining attack.
  public shared(msg) func withdraw_cycles(n : Nat, callback : shared () -> async ()) : async () {
    if(Cycles.available() < 10_000 or n > 10000) {
      return;
    };
    Cycles.add(10000);
    await callback();
    return;
  };

  public shared(msg) func withdraw_cycles_from_other_canister() : async () {
    let result = await Rich.withdraw_cycles(10000, deposit_cycles);
    return;
  };
// Challenge 8 : Rewrite the counter (of day 1) but this time the counter will be kept accross ugprades. Also declare a variable of type **Nat¨¨ called version_number that will keep track of how many times your canister has been upgraded.
  stable var counter : Nat = 0;
  public func increment_counter(n: Nat) : async Nat {
    counter += n;
    return counter;
  };
  
  stable var version_number : Nat = 0;
  system func preupgrade() {
    version_number += 1;
  };

// Challenge 9 : In a new file, copy and paste the functionnalities you've created in challenges 2 to 5. This time the hashmap and all records should be preserved accross upgrades.

// Challenge 10 (optionale) : In autonomy, write a CRUD canister, you can add as much functionnalities as you want, a few examples :
  // Anonymous principal rejection.
  // Cycle functionnality for registration.
  // Admin management.
};
