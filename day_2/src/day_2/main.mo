import Nat8 "mo:base/Nat8";
import Nat "mo:base/Nat";
import Prim "mo:⛔";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Iter "mo:base/Iter";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

//Challenge 1 : Write a function nat_to_nat8 that converts a Nat n to a Nat8. Make sure that your function never trap.
  public func nat_to_nat8(n : Nat) : async Nat8 {
    if (n < 256) {
      return Nat8.fromNat(n);
    } else {
      let n8 : Nat8 = 255;
      return n8;
    }
  };

// Challenge 2 : Write a function max_number_with_n_bits that takes a Nat n and returns the maximum number than can be represented with only n-bits.
  public func max_number_with_n_bits(n : Nat) : async Nat {
    return 2**n - 1;
  };

 // Challenge 3 : Write a function decimal_to_bits that takes a Nat n and returns a Text corresponding to the binary representation of this number.
  //Note : decimal_to_bits(255) -> "11111111".
  public func decimal_to_bits(n : Nat) : async Text {
    var b: Nat = n;
    var remainder: Nat = 0;
    var bitsString: Text = "";
    while (b > 0) {
      remainder := b % 2;
      bitsString := Nat.toText(remainder) # bitsString;
      b := b / 2;      
    };
    return bitsString;
  };

// Challenge 4 : Write a function capitalize_character that takes a Char c and returns the capitalized version of it.
  public func capitalize_character(c : Char) : async Char {
    return Prim.charToUpper(c);
  };
// Challenge 5 : Write a function capitalize_text that takes a Text t and returns the capitalized version of it.
  public func capitalize_text(t : Text) : async Text {
    return Text.map(t, Prim.charToUpper);
  };
// Challenge 6 : Write a function is_inside that takes two arguments : a Text t and a Char c and returns a Bool indicating if c is inside t .
  public func is_inside(t : Text, c: Char) : async Bool {
    for(char in t.chars()){
      if (char == c) {
        return true;
      }
    };
    return false;
  };
// Challenge 7 : Write a function trim_whitespace that takes a text t and returns the trimmed version of t. Note : Trim means removing any leading and trailing spaces from the text : trim_whitespace(" Hello ") -> "Hello".
  public func trim_whitespace(t : Text) : async Text {
    var trimmed: Text = "";
    for(char in t.chars()){
      if (char != ' ') {
        trimmed := trimmed # Char.toText(char);
      }
    };
    return trimmed;
  };

// Challenge 8 : Write a function duplicated_character that takes a Text t and returns the first duplicated character in t converted to Text. Note : The function should return the whole Text if there is no duplicate character : duplicated_character("Hello") -> "l" & duplicated_character("World") -> "World".
  public func duplicated_character(t : Text) : async Text {
    var occurrencesCounter = 0;
    for(charA in t.chars()) {
      for(charB in t.chars()) {
        if (charA == charB) {
          occurrencesCounter += 1;
        };
        if (occurrencesCounter > 1) {
          return Char.toText(charA);
        };
      };
      occurrencesCounter := 0;
    };
    return t;
  };
// Challenge 9 : Write a function size_in_bytes that takes Text t and returns the number of bytes this text takes when encoded as UTF-8.
  public func size_in_bytes(t : Text) : async Nat {
    return t.size() * 4;
  };
// Challenge 10 : https://github.com/motoko-bootcamp/bootcamp/blob/main/daily_challenges/day_2/CHALLENGE.MD
  // Watch this video on bubble sort.
  // Implement a function bubble_sort that takes an array of natural numbers and returns the sorted array .
};

// https://github.com/testpuddle/Minting-NFTs