import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Result "mo:base/Result";
import Nat "mo:base/Nat";
import Hash "mo:base/Hash";
import List "mo:base/List";
import Iter "mo:base/Iter";
import HTTP "http";
import Blob "mo:base/Blob";
import Array "mo:base/Array";

import OtherCanister "canister:day_6_other_canister";

// import Ledger "canister:ledger";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

// Challenge 1 : Create an actor in main.mo and declare the following types.
  // TokenIndex of type Nat.
  // Error which is a variant type with multiples tags :
  public type TokenIndex = Nat;
  public type Error = {
    #failed;
    #invalid;
  };
  public type Result = Result.Result<(), Text>;

// Challenge 2 : Declare an HashMap called registry with Key of type TokenIndex and value of type Principal. This will keeep track of which principal owns which TokenIndex.
  var registry = HashMap.HashMap<TokenIndex, Principal>(0, Nat.equal, Hash.hash);

// Challenge 3 : Declare a variable of type Nat called nextTokenIndex, initialized at 0 that will keep track of the number of minted NFTs.
  stable var nextTokenIndex : Nat = 0;
  // Write a function called mint that takes no argument.
  // This function should :
    // Returns a result of type Result and indicate an error in case the caller is anonymous.
    // If the user is authenticated : associate the current TokenIndex with the caller (use the HashMap we've created) and increase nextTokenIndex.
  public shared(msg) func mint() : async Result {
    if(Principal.isAnonymous(msg.caller)){
        return #err("You need to be authenticated to mint");
    } else {
        registry.put(nextTokenIndex, msg.caller);
        nextTokenIndex += 1;
        return #ok;
    }
  };

// Challenge 4 : Write a function called transfer that takes two arguments :
  // to of type Principal.
  // tokenIndex of type Nat.
  // This function will transfer ownership of tokenIndex to the specified principal. You will check for eventuals errors and returns a result of type Result.
  public shared(msg) func transfer(to: Principal, tokenIndex: Nat) : async Result {
    if(Principal.isAnonymous(msg.caller)){
      return #err("You need to be authenticated to transfer NFTs");
    };
    if(msg.caller == Principal.fromText("2vxsx-fae")){
      return #err("You cannot transfer NFTs to Anonymous");
    };
    switch(registry.get(tokenIndex)) {
      case(null) {
        return #err("You cannot transfer an NFT that doesn't exist");
      };
      case(?p){
        if(msg.caller == p){
          registry.put(tokenIndex, to);
          return #ok;
        } else {
          return #err("You need to be the NFT's owner to transfer it.");
        }
      };
    }
  };

// Challenge 5 : Write a function called balance that takes no arguments but returns a list of tokenIndex owned by the called.
  public shared(msg) func balance() : async List.List<TokenIndex> {
    let callersTokens : List.List<TokenIndex> = null;
    if(Principal.isAnonymous(msg.caller)){
      return callersTokens;
    } 
    else {
      for (i in Iter.range(0, nextTokenIndex - 1)) {
        switch(registry.get(i)) {
          case(null) {};
          case(?p){
            if(msg.caller == p){
              ignore List.push<TokenIndex>(i, callersTokens);
            }
          };
        }             
      };
      return callersTokens;
    }
  };

// Challenge 6 : Write a function called http_request that should return a message indicating the number of nft minted so far and the principal of the latest minter. (Use the section on http request in the daily guide).
  public query func http_request(request : HTTP.Request) : async HTTP.Response {
    let response = {
      body = {numberNFTsMinted = nextTokenIndex; latestMinter = registry.get(nextTokenIndex - 1)};
      headers = [("Content-Type", "application/json")];
      status_code = 200 : Nat16;
      streaming_strategy = null
    };
    return(response)
  };

// Challenge 7 : Modify the actor so that you can safely upgrade it without loosing any state.
  stable var entries : [(Nat, Principal)] = [];

  system func preupgrade() {
      entries := Iter.toArray(registry.entries());
  };

  system func postupgrade() {
      registry := HashMap.fromIter<Nat, Principal>(entries.vals(), 0, Nat.equal, Hash.hash);
      entries := [];
  };

// Challenge 8 : Create another canister and use to mint a NFT by calling the mint method of your first canister.
  public shared(msg) func mintInOtherCanister() : async Result {
    let result = await OtherCanister.mint();
     return result;
  };

// Bonus optional (Only take on those challenges if you have nothing else to do today...)
  public shared (msg) func whoami() : async Principal {
    return msg.caller;
  };
// Challenge 9 : In a new actor implement a function called default_account that returns the address of the subbacount 0 for the canister.
  public func default_account() : async Principal {
    return await whoami();
  };

// Challenge 10 : Write two functions :
  // balance : takes no arguments and returns the balance of icps of the canister defaul account.
  type AccountIdentifier = Blob;
  type AccountBalanceArgs = {
    account: AccountIdentifier;
  };
  /* public func balance() : async Ledger.Tokens {
    return await Ledger.account_balance({account = Blob.fromArrayMut(Array.init(32, 0 : Nat8))});
  }; */
  // transfer : takes
};
