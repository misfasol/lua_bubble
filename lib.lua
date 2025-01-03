local lib_c = require "lib_c"

local M = {}

local function tamanhos(s)
  local mw = 0
  local h = 0
  local w = 0
  local atual = ""
  local tamanhoS = #s
  for i = 1, tamanhoS do
    atual = s:sub(i, i)
  	if atual == "\n" then
    	h = h + 1
    	w = 0
    else
      w = w + 1
    	if w > mw then
      	mw = w
      end
    end
  end
  if s:sub(tamanhoS, tamanhoS) ~= "\n" then
  	h = h + 1
  end
  return mw, h
end

local Model = {}

function Model:new()
  local novo = {}
  self.__index = self
  novo.saida = 113
  novo.rodando = true
  novo.KEY_UP = 72
  novo.KEY_DOWN = 80
  return setmetatable(novo, self)
end

function Model:rodar()
  local s = self:view()
  local tam = #s
  io.write(s)
  if s:sub(tam, tam) ~= "\n" then print() end
  local _, h = tamanhos(s)
  while self.rodando do
  	self:update(lib_c.getch())
    io.write(string.format("\x1b[%dA", h))
  	io.write(self:view())
    if s:sub(tam, tam) ~= "\n" then print() end
  end
end

M.getch = lib_c.getch
M.Model = Model

return M
