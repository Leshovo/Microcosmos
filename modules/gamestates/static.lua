require('modules.revised') -- Modulo de OOP
require('maptile') -- Modulo que carrega os tiles

local graphics = require('modules.gra') -- Modulo dis graficos e a UI
local font = require('modules.font') -- Modulo da fonte

local Balls = require('modules.balls')
local Heroes = require('modules.heroes')
local Enemies = require('modules.enemies')

local suit = require('suit') -- Modulo de layout grafica simples
local Timer = require('modules/hump.timer') -- Modulo com funçöes temporais

local static = {}

static = Gamestate.new() -- Objetos nao variaveis

function static:init() -- So sr executa quando entra por primeira vez no estado
	graphics.clear() -- Limpando a tela dos botões do menu
end

function static:draw()

  graphics.setBackgroundColor(0,0,0,255) --Setting background color
  font.setnf(16) -- Setting defeault font at x size


  drawMap() -- Desenhando os  tiles do tabuleiro


  Heroes.Iustitia:drawGlobalStatus(0, 270) -- Stats Principais da Heroes.Iustitia
  Heroes.Lehoia:drawGlobalStatus(0, 285) -- Stats Principais Heroes.Lehoia
  Heroes.Vorona:drawGlobalStatus(0, 300) -- Stats Principais Heroes.Vorona

  Heroes.Iustitia:drawRectangle()
  Heroes.Lehoia:drawRectangle()
  Heroes.Vorona:drawRectangle()


  Enemies[1]:drawGlobalStatus(0, 315)
  Enemies[2]:drawGlobalStatus(0, 330)
  Enemies[3]:drawGlobalStatus(0, 345)

  Enemies[1]:drawRectangle()
  Enemies[2]:drawRectangle()
  Enemies[3]:drawRectangle()


  Balls[1]:drawBall(Balls[1].color)


  graphics.print("Comands:  " .. command[1], 0, 430)
  graphics.print("matrixNumpad[1&2]: " .. tostring(stringNumpad), 0, 450)
  --graphics.print(tostring(matrixNumpad[2]),180, 450)
  graphics.print("isBallPickable: " .. tostring(isBallPickable), 0, 400)
  graphics.print("isNumpadFirstExecution: " .. tostring(isNumpadFirstExecution), 0, 415)
  graphics.print("Pontos Time Cuadrado: " .. tostring(timeOneCounter), 300, 400)
  graphics.print("Pontos Time Triangulo: " .. tostring(timeTwoCounter), 300, 415)


  Gamestate.switch(game) -- Passa ao estado game
end

return static
