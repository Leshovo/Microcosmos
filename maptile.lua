-- declaring local variables that will be used only inside map-functions.lua
local tileWidth, tileHeight, tileset, quads, tileTable

function loadMap(path)
  love.filesystem.load(path)() -- attention! extra parenthesis
end

function newMap(larguraTile, alturaTile, caminhoTileset, tileString, quadInfo)
  
  tileWidth = larguraTile
  tileHeight = alturaTile
  tileset = love.graphics.newImage(caminhoTileset)
  
  local tilesetWidth, tilesetHeight = tileset:getWidth(), tileset:getHeight()
  
  quads = {}
  
  for index, info in ipairs(quadInfo) do
    -- info[1] = the character, info[2] = x, info[3] = y
    quads[info[1]] = love.graphics.newQuad(info[2], info[3], tileWidth,  tileHeight, tilesetWidth, tilesetHeight)
  end
  
  tileTable = {}
  
  local width = #(tileString:match("[^\n]+"))

  for x = 1, width, 1 do tileTable[x] = {} end

  local rowIndex, columnIndex = 1, 1
  for row in tileString:gmatch("[^\n]+") do
    assert(#row == width, 'Map is not aligned: width of row ' .. tostring(rowIndex) .. ' should be ' .. tostring(width) .. ', but it is ' .. tostring(#row))
    columnIndex = 1
    for character in row:gmatch(".") do
      tileTable[columnIndex][rowIndex] = character
      columnIndex = columnIndex + 1
    end
    rowIndex=rowIndex+1
  end

end

function drawMap()
  for columnIndex,column in ipairs(tileTable) do
    for rowIndex,char in ipairs(column) do
      local x,y = (columnIndex-1)*tileWidth, (rowIndex-1)*tileHeight
      love.graphics.draw(tileset, quads[ char ] , x, y)
    end
  end
end
