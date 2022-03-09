export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'greet' : IDL.Func([IDL.Text], [IDL.Text], []),
    'increase_by_index' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Vec(IDL.Nat)], []),
    'init_count' : IDL.Func([IDL.Nat], [IDL.Vec(IDL.Nat)], []),
    'nat_opt_to_nat' : IDL.Func([IDL.Opt(IDL.Nat), IDL.Nat], [IDL.Nat], []),
    'populate_array' : IDL.Func(
        [IDL.Vec(IDL.Opt(IDL.Nat))],
        [IDL.Vec(IDL.Nat)],
        [],
      ),
    'seven' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Text], []),
    'squared_array' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Vec(IDL.Nat)], []),
    'sum_of_array' : IDL.Func([IDL.Vec(IDL.Nat)], [IDL.Nat], []),
  });
};
export const init = ({ IDL }) => { return []; };
