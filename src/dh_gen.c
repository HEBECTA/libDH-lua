#include "dh_gen.h"

#include <openssl/bio.h>
#include <openssl/dh.h>
#include <errno.h>

#ifdef __cplusplus
extern "C"{
#endif

static int gen_dh_params(lua_State *L) {

        int rc = 0;

        int arg_bit_size = luaL_checkint (L, 1);
        char *file_name = luaL_checkstring(L, 2);

        BIO *bio_out = NULL;
        DH *dh = NULL;
        
        dh = DH_new();

        if ( dh == NULL ){

                rc = EPERM;
                goto EXIT_FUN;  
        }

        if (!DH_generate_parameters_ex(dh, arg_bit_size, DH_GENERATOR_2, NULL)){

                rc = EAGAIN;
                goto EXIT_FUN;
        }

        bio_out = BIO_new_file(file_name, "w");

        if (bio_out == NULL){

                rc = EPERM;
                goto EXIT_FUN;  
        }

        rc = PEM_write_bio_DHparams(bio_out, dh);
        rc = !rc;

EXIT_FUN:

        if ( bio_out != NULL )
                BIO_free(bio_out);

        if ( dh != NULL )  
                DH_free(dh);

        lua_pushnumber(L, rc);

        return 1;
}

static const struct luaL_Reg dh_lib [] = {
      {"generate dh parameters file", gen_dh_params},
      {NULL, NULL} 
    };

int luaopen_mylib (lua_State *L){
    luaL_newlib(L, dh_lib);
    return 1;
}

#ifdef __cplusplus
}
#endif
