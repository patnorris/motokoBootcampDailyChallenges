import type { Principal } from '@dfinity/principal';
export interface Animal { 'specie' : string, 'energy' : bigint }
export interface Company { 'marketCap' : bigint, 'name' : string }
export type List = [] | [[Animal, List]];
export interface _SERVICE {
  'create_animal_then_takes_a_break' : (
      arg_0: string,
      arg_1: bigint,
    ) => Promise<Animal>,
  'fun' : () => Promise<Company>,
  'get' : (arg_0: List, arg_1: bigint) => Promise<[] | [Animal]>,
  'get_animals' : () => Promise<Array<Animal>>,
  'greet' : (arg_0: string) => Promise<string>,
  'is_null' : (arg_0: List) => Promise<boolean>,
  'last' : (arg_0: List) => Promise<[] | [Animal]>,
  'push_animal' : (arg_0: Animal) => Promise<undefined>,
  'reverse' : (arg_0: List) => Promise<List>,
  'size' : (arg_0: List) => Promise<bigint>,
}
