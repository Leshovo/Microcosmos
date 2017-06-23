require('modules.revised') -- Modulo de OOP
require('maptile') -- Modulo que carrega os tiles
require('modules.comand') -- Modulo que le e executa os comandos

local graphics = require('modules.gra') -- Modulo dis graficos e a UI
local font = require('modules.font') -- Modulo da fonte
Button = require('modules.button')
Buttons = require('modules.buttons')

local Balls = require('modules.balls')
local Heroes = require('modules.heroes')
local Enemies = require('modules.enemies')

--local Comand = require('modules.Comand')

suit = require('suit') -- Modulo de layout grafica simples
local Timer = require('modules/hump.timer') -- Modulo com funçöes temporais
Gamestate = require('modules/hump.gamestate') -- Modulo com funções de estados para love

menu = require('modules/gamestates.menu')
static = require('modules/gamestates.static')
options = require('modules/gamestates.options')
game = require('modules/gamestates.game')
ui = require('modules/gamestates.ui')
--comand = require('modules/gamestates.comand')

function love.load(arg)

  if arg[#arg] == "-debug" then require("mobdebug").start() end
  
	Gamestate.registerEvents()

	width, height = love.graphics.getDimensions()
	halfwidth, halfheight = width/2, height/2

	loadMap('maps/board1.lua') -- Carregando os tiles do tabuleiro

	--comand = Comand:new() -- Criando uma instancia da analise de comandos

	--comando1 = ""

  command = {
    "",
    "",
    ""
  }
  
	Heroes.Iustitia:modifyAllCharacterStats{40,40,40,40,40,40,40,40}
  --Heroes.Iustitia:modifyAxisPosition(4, 4)
  
	Gamestate.switch(game)
end

function love.update(dt)
	Timer.update(dt)
	Gamestate.update(dt)
end

function love.quit()

end
