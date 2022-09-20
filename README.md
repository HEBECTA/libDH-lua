# libDH-lua

Function "gen_dh_params" accepts two parameters

First: int -> size of dh parameter to be generated (length in bits) for example: 1024
Second: string -> file name, for example: path/to/file.pem

Return value: 0 on success and positive integer on failure.
