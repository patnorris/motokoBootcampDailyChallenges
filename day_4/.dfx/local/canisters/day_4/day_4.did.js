export const idlFactory = ({ IDL }) => {
  const List = IDL.Rec();
  const Animal = IDL.Record({ 'specie' : IDL.Text, 'energy' : IDL.Nat });
  const Company = IDL.Record({ 'marketCap' : IDL.Nat, 'name' : IDL.Text });
  List.fill(IDL.Opt(IDL.Tuple(Animal, List)));
  return IDL.Service({
    'create_animal_then_takes_a_break' : IDL.Func(
        [IDL.Text, IDL.Nat],
        [Animal],
        [],
      ),
    'fun' : IDL.Func([], [Company], []),
    'get' : IDL.Func([List, IDL.Nat], [IDL.Opt(Animal)], []),
    'get_animals' : IDL.Func([], [IDL.Vec(Animal)], []),
    'greet' : IDL.Func([IDL.Text], [IDL.Text], []),
    'is_null' : IDL.Func([List], [IDL.Bool], []),
    'last' : IDL.Func([List], [IDL.Opt(Animal)], []),
    'push_animal' : IDL.Func([Animal], [], []),
    'reverse' : IDL.Func([List], [List], []),
    'size' : IDL.Func([List], [IDL.Nat], []),
  });
};
export const init = ({ IDL }) => { return []; };
