import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'greet' : (arg_0: string) => Promise<string>,
  'increase_by_index' : (arg_0: Array<bigint>) => Promise<Array<bigint>>,
  'init_count' : (arg_0: bigint) => Promise<Array<bigint>>,
  'nat_opt_to_nat' : (arg_0: [] | [bigint], arg_1: bigint) => Promise<bigint>,
  'populate_array' : (arg_0: Array<[] | [bigint]>) => Promise<Array<bigint>>,
  'seven' : (arg_0: Array<bigint>) => Promise<string>,
  'squared_array' : (arg_0: Array<bigint>) => Promise<Array<bigint>>,
  'sum_of_array' : (arg_0: Array<bigint>) => Promise<bigint>,
}
