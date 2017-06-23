local tileString = [[
add##ddg
beeeeeeh
beeeeeeh
bee$$eeh
bee$$eeh
beeeeeeh
beeeeeeh
cff##ffj
]]

local quadInfo = { 
  { '#', 128, 0 }, -- Porteria
  { 'a', 160, 0 }, -- Quina SupEsq
  { 'b', 160, 32 }, -- Lateral Esquerda
  { 'c', 160, 64 }, -- Quina InfEsq
  { 'd', 192, 0 }, -- Lateral Superior
  { 'e', 192, 32 }, -- Chao Normal
  { 'f', 192, 64 }, -- Lateral Inferior
  { 'g', 224, 0 }, -- Quina SupDir
  { 'h', 224, 32 }, -- Lateral Direita
  { 'j', 224, 64 }, -- Quina InfDir
  { '1', 320, 0}, 
  { '2', 320, 32},
  { '3', 348, 0},
  { '4', 348, 32},
  { '$', 192, 128}
}

newMap(32, 32,'/images/tiles.png', tileString, quadInfo)
