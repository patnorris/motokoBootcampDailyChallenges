export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'add_favorite_number' : IDL.Func([IDL.Nat], [IDL.Text], []),
    'add_favorite_number1' : IDL.Func([IDL.Nat], [], []),
    'delete_favorite_number' : IDL.Func([], [], []),
    'greet' : IDL.Func([IDL.Text], [IDL.Text], []),
    'show_favorite_number' : IDL.Func([], [IDL.Opt(IDL.Nat)], []),
    'update_favorite_number' : IDL.Func([IDL.Nat], [IDL.Opt(IDL.Nat)], []),
  });
};
export const init = ({ IDL }) => { return []; };
