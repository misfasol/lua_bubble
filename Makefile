lib:
	gcc lib_c.c -shared -o lib_c.dll -fPIC -L../interpretador/lua-5.4.7/src -llua
	lua ./prim.lua
