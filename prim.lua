local lib = require "lib"

local modelo = lib.Model:new()
modelo.cursor = 1
modelo.selecionado = false
modelo.opcoes = {"op1", "op2", "op3"}

function modelo:update(key)
	if key == self.saida then
		self.rodando = false
		return
	elseif key == modelo.KEY_UP then
		if self.cursor > 1 then
			self.cursor = self.cursor - 1
		end
	elseif key == modelo.KEY_DOWN then
		if self.cursor < # self.opcoes then
			self.cursor = self.cursor + 1
		end
	elseif key == modelo.KEY_SPACE then
		self.selecionado = true
		self.rodando = false
	end
end

function modelo:view()
	local s = "Tem trees opcoes?\n"
	for i, p in ipairs(modelo.opcoes) do
		s = s .. i .. ": ["
		if i == modelo.cursor then
			s = s .. "O"
		else
			s = s .. " "
		end
		s = s .. "] -> " .. p .. "\n"
	end
	if self.selecionado then
		s = s .. "selecionado: " .. self.cursor .. " -> " .. self.opcoes[self.cursor]
	end
	return s
end

modelo:rodar()
