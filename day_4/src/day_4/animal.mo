module  {
  public type Animal = {
    specie : Text;
    //var energy : Nat;
    energy : Nat;
  };
  
  // Challenge 3 : In animal.mo create a public function called animal_sleep that takes an Animal and returns the same Animal where the field energy has been increased by 10. Note : As this is a public function of a module, you don't need to make the return type Async !
  public func animal_sleep(animal : Animal) : Animal {
    //animal.energy += 10;
    //return animal;
    return {
      specie = animal.specie;
      energy = animal.energy + 10;
    };
  };
};
