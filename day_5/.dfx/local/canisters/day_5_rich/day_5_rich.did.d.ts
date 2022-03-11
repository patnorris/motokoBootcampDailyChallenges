import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'add_favorite_number' : (arg_0: bigint) => Promise<string>,
  'add_favorite_number1' : (arg_0: bigint) => Promise<undefined>,
  'delete_favorite_number' : () => Promise<undefined>,
  'deposit_cycles' : () => Promise<bigint>,
  'greet' : (arg_0: string) => Promise<string>,
  'is_anonymous' : () => Promise<boolean>,
  'show_favorite_number' : () => Promise<[] | [bigint]>,
  'update_favorite_number' : (arg_0: bigint) => Promise<[] | [bigint]>,
  'withdraw_cycles' : (arg_0: bigint, arg_1: [Principal, string]) => Promise<
      undefined
    >,
}
