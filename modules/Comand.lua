require("modules.revised")

local Comand = class()

Comand.comando = ""
Comand.textcom = "Nothing"
Comand.isComandFirstExecution = true


function Comand:execute()
  
  if comando1 == "A" then
		self.tetxcom = "Move"
		self:moveMenu()
	end
  
end

function Comand:moveMenu()
  
	if comando1 == "AA" then
		self:moveCharacters(1)
	elseif comando1 == "AB" then
	  self:moveCharacters(2)
	elseif comando1 == "AC" then
	  self:moveCharacters(3)
	end
  
end

function Comand:moveCharacters(numberCharacter)
	if numberCharacter == 1 then
		self.textcom = "Move First Character"

		if not isEnemyTurn then
		  Heroes.Iustitia:modifyAxisPosition(matrixNumpad[1], matrixNumpad[2])
		elseif isEnemyTurn then
		  Enemies[1]:modifyAxisPosition(matrixNumpad[1], matrixNumpad[2])
		end -- end if isEnemyTurn

	elseif numberCharacter == 2 then
		self.textcom = "Move Second Character"

	  if not isEnemyTurn then
	    Heroes.Lehoia:modifyAxisPosition(matrixNumpad[1], matrixNumpad[2])
	  elseif isEnemyTurn then
	    Enemies[2]:modifyAxisPosition(matrixNumpad[1], matrixNumpad[2])
	  end -- end if isEnemyTurn

	elseif numberCharacter == 3 then
		self.textcom = "Move Third Character"

	  if not isEnemyTurn then
	    Heroes.Vorona:modifyAxisPosition(matrixNumpad[1], matrixNumpad[2])
	  elseif isEnemyTurn then
	    Enemies[3]:modifyAxisPosition(matrixNumpad[1], matrixNumpad[2])
	  end -- end if isEnemyTurn

	end
end

function Comand:clear()
  
  comando1 = ""
  isComandFirstExecution = true
  
end

return Comand