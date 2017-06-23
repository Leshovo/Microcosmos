local ui = require('modules/gamestates.ui')
local suit = require('modules.suit')

local Balls = require('modules.balls')
local Heroes = require('modules.heroes')
local Enemies = require('modules.enemies')

local Input = require('modules.Input')
local input = Input()

local Bidimensional = require('modules.bidimensional')

local game = {}

game = Gamestate.new() -- Estado variavel do jogo

function game:load()
	
end

function game:draw()
	suit.draw() -- Desenhando botões
	ui:draw()
	static:draw() -- Desenhando todos os elementos estaticos , caso limpe a tela
end


local isNumberFirstPressed = false
function game:update(dt)
  ui:update()
	
	executeCommands()
	
	updateComplexStats()

	Balls[1]:updBall()

	Heroes.Iustitia:isInAreaPoint()
	Heroes.Lehoia:isInAreaPoint()
	Heroes.Vorona:isInAreaPoint()
	Enemies[1]:isInAreaPoint()
	Enemies[2]:isInAreaPoint()
	Enemies[3]:isInAreaPoint()
end


function game:mousepressed(mouseAxisx, mouseAxisy, mouseButton, mouseIsTouch)
	if mouseAxisx >= 0 and mouseAxisx <= 32 then
		
end

function executeCommands()
  if command[1] == "A" then
		textcom = "Move"
    
	elseif command[1] == "AA" then
		moveCharacters(1)
    
	elseif command[1] == "AB" then
	  moveCharacters(2)
    
	elseif command[1] == "AC" then
	  moveCharacters(3)
    
	end
	
end

function moveCharacters(numberCharacter)
	if numberCharacter == 1 then
		textcom = "Move First Character"

		if not isEnemyTurn then
		  Heroes.Iustitia:modifyAxisPosition(matrixNumpad[1], matrixNumpad[2])
		elseif isEnemyTurn then
		  Enemies[1]:modifyAxisPosition(matrixNumpad[1], matrixNumpad[2])
		end -- end if isEnemyTurn

	elseif numberCharacter == 2 then
		textcom = "Move Second Character"

	  if not isEnemyTurn then
	    Heroes.Lehoia:modifyAxisPosition(matrixNumpad[1], matrixNumpad[2])
	  elseif isEnemyTurn then
	    Enemies[2]:modifyAxisPosition(matrixNumpad[1], matrixNumpad[2])
	  end -- end if isEnemyTurn

	elseif numberCharacter == 3 then
		textcom = "Move Third Character"

	  if not isEnemyTurn then
	    Heroes.Vorona:modifyAxisPosition(matrixNumpad[1], matrixNumpad[2])
	  elseif isEnemyTurn then
	    Enemies[3]:modifyAxisPosition(matrixNumpad[1], matrixNumpad[2])
	  end -- end if isEnemyTurn

	end
end


function updateComplexStats(charactersTable)
	-- for index, tabela in ipairs(charactersTable)
		
		-- for key, _ in pairs(value) do
			-- tabela.key:updateComplexStats()
		-- end
	-- Heroes.Iustitia:updateComplexStats()
	Heroes.Lehoia:updateComplexStats()
	Heroes.Vorona:updateComplexStats()
	
	Enemies[1]:updateComplexStats()
	Enemies[2]:updateComplexStats()
	Enemies[3]:updateComplexStats()
end


function isMouseAxisxInAxisx(tabelaMouseaxIntervalo)
	local tabelaMouseaxIntervalo[mouseAxisx] = 
end

return game
