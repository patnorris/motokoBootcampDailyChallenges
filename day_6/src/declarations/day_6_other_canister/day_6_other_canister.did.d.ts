import type { Principal } from '@dfinity/principal';
export type HeaderField = [string, string];
export type List = [] | [[TokenIndex, List]];
export interface Request {
  'url' : string,
  'method' : string,
  'body' : Array<number>,
  'headers' : Array<HeaderField>,
}
export interface Response {
  'body' : { 'numberNFTsMinted' : bigint, 'latestMinter' : [] | [Principal] },
  'headers' : Array<HeaderField>,
  'streaming_strategy' : [] | [StreamingStrategy],
  'status_code' : number,
}
export type Result = { 'ok' : null } |
  { 'err' : string };
export type StreamingCallback = (arg_0: StreamingCallbackToken) => Promise<
    StreamingCallbackResponse
  >;
export interface StreamingCallbackResponse {
  'token' : [] | [StreamingCallbackToken],
  'body' : Array<number>,
}
export interface StreamingCallbackToken {
  'key' : string,
  'index' : bigint,
  'content_encoding' : string,
}
export type StreamingStrategy = {
    'Callback' : {
      'token' : StreamingCallbackToken,
      'callback' : StreamingCallback,
    }
  };
export type TokenIndex = bigint;
export interface _SERVICE {
  'balance' : () => Promise<List>,
  'greet' : (arg_0: string) => Promise<string>,
  'http_request' : (arg_0: Request) => Promise<Response>,
  'mint' : () => Promise<Result>,
  'transfer' : (arg_0: Principal, arg_1: bigint) => Promise<Result>,
}
