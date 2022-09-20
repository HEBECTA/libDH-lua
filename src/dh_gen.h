#ifndef DH_GEN_H
#define DH_GEN_H

#ifdef __cplusplus
  #include "lua.hpp"
#else
  #include "lua.h"
  #include "lualib.h"
  #include "lauxlib.h"
#endif
#include <openssl/bio.h>
#include <openssl/dh.h>

#ifdef __cplusplus
extern "C"{
#endif

static int gen_dh_params(lua_State *L);

static const struct luaL_Reg dh_lib [];

int luaopen_mylib (lua_State *L);

#ifdef __cplusplus
}
#endif

#endif