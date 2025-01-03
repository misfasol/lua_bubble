local lib = require "lib"

local modelo = lib.Model:new()
modelo.cursor = 1
modelo.opcoes = {"op1", "op2"}

function modelo:update(key)
	if key == self.saida then
		self.rodando = false
		return
	elseif key == modelo.KEY_UP then
		if modelo.cursor > 1 then
			modelo.cursor = modelo.cursor - 1
		end
	elseif key == modelo.KEY_DOWN then
		if modelo.cursor < # modelo.opcoes then
			modelo.cursor = modelo.cursor + 1
		end
	end
end

function modelo:view()
	local s = "Tem duas opcoes?\n"
	for i, p in ipairs(modelo.opcoes) do
		s = s .. i .. ": ["
		if i == modelo.cursor then
			s = s .. "O"
		else
			s = s .. " "
		end
		s = s .. "] -> " .. p .. "\n"
	end
	return s
end

modelo:rodar()
