import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'add_favorite_number' : (arg_0: bigint) => Promise<string>,
  'add_favorite_number1' : (arg_0: bigint) => Promise<undefined>,
  'delete_favorite_number' : () => Promise<undefined>,
  'greet' : (arg_0: string) => Promise<string>,
  'show_favorite_number' : () => Promise<[] | [bigint]>,
  'update_favorite_number' : (arg_0: bigint) => Promise<[] | [bigint]>,
}
