#include "../interpretador/lua-5.4.7/src/lua.h"
#include "../interpretador/lua-5.4.7/src/lualib.h"
#include "../interpretador/lua-5.4.7/src/lauxlib.h"

#include <conio.h>

static int lua_getch(lua_State *l) {
    int ret = _getch();
    lua_pushinteger(l, ret);
    return 1;
}

static const struct luaL_Reg mylib[] = {
      {"getch", lua_getch},
      {NULL, NULL}
    };

int __declspec(dllexport) luaopen_lib_c(lua_State *L){
    luaL_newlib(L, mylib);
    return 1;
}

