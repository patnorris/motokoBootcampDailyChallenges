export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'add_favorite_number' : IDL.Func([IDL.Nat], [IDL.Text], []),
    'add_favorite_number1' : IDL.Func([IDL.Nat], [], []),
    'delete_favorite_number' : IDL.Func([], [], []),
    'deposit_cycles' : IDL.Func([], [IDL.Nat], []),
    'greet' : IDL.Func([IDL.Text], [IDL.Text], []),
    'increment_counter' : IDL.Func([IDL.Nat], [IDL.Nat], []),
    'is_anonymous' : IDL.Func([], [IDL.Bool], []),
    'show_favorite_number' : IDL.Func([], [IDL.Opt(IDL.Nat)], []),
    'update_favorite_number' : IDL.Func([IDL.Nat], [IDL.Opt(IDL.Nat)], []),
    'withdraw_cycles' : IDL.Func([IDL.Nat, IDL.Func([], [], [])], [], []),
    'withdraw_cycles_from_other_canister' : IDL.Func([], [], []),
  });
};
export const init = ({ IDL }) => { return []; };
