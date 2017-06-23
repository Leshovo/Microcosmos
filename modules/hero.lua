require('modules.revised')
local graphics = require('modules.gra')
local Bidimensional = require('modules.bidimensional')
Timer = require('modules/hump.timer')


local Hero = class()
Hero.isInBallPosesion = false


local atributos =
{
  Strength = 10,
  Constitution = 10,
  Dexterity = 10,
  Ability = 10,
  Inteligence = 10,
  Will = 10,
  Perception = 10,
  Charisma = 10
}

local habilidades =
{
  Alert = 3,
  Concentration = 3,
  Education = 3,
  Figth = 3,
  Persuasion = 3,
  Aim = 3,
  Stealth = 3,
  Atletics = 3
}

local complex =
{
  VitalityPoints = ((atributos.Constitution + atributos.Will)/2)*5,
  Energy = (atributos.Constitution+atributos.Will) + (habilidades.Atletics+habilidades.Concentration)*2,
  Initiative = ((atributos.Dexterity + atributos.Perception)/2) + habilidades.Alert,
  Attack = ((atributos.Strength + atributos.Ability)/2) + (habilidades.Figth + habilidades.Atletics),
  RangedAttack = (atributos.Inteligence + atributos.Perception) + (habilidades.Concentration + habilidades.Aim),
  fisicDefense = habilidades.Figth + atributos.Dexterity + 8,
  rangedDefense = atributos.Perception + habilidades.Concentration + 8
}


function Hero:updateComplexStats()
  self.Attack = ((self.Strength + self.Ability)/2) + (self.Figth + self.Atletics)
  self.RangedAttack = (self.Inteligence + self.Perception) + (self.Concentration + self.Aim)
  self.VitalityPoints = ((self.Constitution + self.Will)/2) *5
  self.Energy = (self.Constitution+self.Will) + ((self.Atletics+self.Concentration))*2  -- Energia para toda acção
  self.fisicDefense = self.Figth + self.Dexterity + 8
  self.rangedDefense = self.Perception + self.Concentration + 8
	self.Initiative = ((self.Dexterity + self.Perception)/2) + self.Alert
end

function Hero:modifyAllCharacterStats(tableAtributes)
  self:modifyCharacterStat("Strength", tableAtributes[1])
  self:modifyCharacterStat("Constitution", tableAtributes[2])
  self:modifyCharacterStat("Dexterity", tableAtributes[3])
  self:modifyCharacterStat("Ability", tableAtributes[4])
  self:modifyCharacterStat("Inteligence", tableAtributes[5])
  self:modifyCharacterStat("Will", tableAtributes[6])
  self:modifyCharacterStat("Perception", tableAtributes[7])
  self:modifyCharacterStat("Charisma", tableAtributes[8])
end

function Hero:modifyCharacterStat(indexDesiredStat, number)
  local index = indexDesiredStat
  self[index] = self[index] + number
end


class:convert(atributos)
class:convert(habilidades)
class:convert(complex)
Hero:addparent(atributos)
Hero:addparent(habilidades)
Hero:addparent(complex)

Hero:addparent(Bidimensional)


function Hero:drawGlobalStatus(pixelPositionAxisx, pixelPositionAxisy)
   graphics.print("VitalityPoints: " .. self.VitalityPoints .. "   Energy: " .. self.Energy .. "   fisicDefense: " .. self.fisicDefense .. "   Initiative: " .. self.Initiative, x, pixelPositionAxisy)
end


function Hero:calculateDamage(attack, defense)
  local resultDamage = (attack-defense)
  if resultDamage < 0 then
    resultDamage = 0
  else
    resultDamage = (-resultDamage)
  end

  return resultDamage
end


function Hero:calculateRangedDamage(rangedAttack, rangedDefense)
  local resultRangedDamage = (rangedAttack - rangedDefense)
  if resultRangedDamage < 0 then
    resultRangedDamage = 0
  else
    resultRangedDamage = (-resultRangedDamage)
  end

  return resultRangedDamage
end


function Hero:isInBallPosesion()
	if self.isInBallPosesion then
		self.isInBallPosesion = false
	elseif not self.isInBallPosesion then
		self.isInBallPosesion = true
	end
end

function Hero:isInAreaPoint()
	Hero:isHeroInBoardAxisxAreaPoint()
end

function Hero:isHeroInBoardAxisxAreaPoint()
	if not isEnemyTurn then
		if self.indexBoardPositionAxisy == 8 and self.indexBoardPositionAxisx == 4 or self.indexBoardPositionAxisx == 5 then

			isBallInAreaPoint = true
			self.isInBallPosesion = false
			isBallFirstCheck = true

		end
	elseif isEnemyTurn then
		if self.indexBoardPositionAxisy == 1 and self.indexBoardPositionAxisx == 4 or self.indexBoardPositionAxisx == 5 then
			isBallInAreaPoint = true
			self.isInBallPosesion = false
			isBallFirstCheck = true
		end
	end
end

function dice(var1, var2)
  math.randomseed( os.time() )
  return math.random(var1, var2)
end

-- function Hero:calculateThrowBall(thrower, receiver)
  -- if thrower.isInBallPosesion then
    -- local res = (thrower.Ability+thrower.Aim) + (receiver.Dexterity+receiver.Alert)
    -- local posx = math.abs((thrower.indexBoardPositionAxisx - receiver.indexBoardPositionAxisx))
    -- local posy = math.abs((thrower.indexBoardPositionAxisy - receiver.indexBoardPositionAxisy))

    -- if posx == 1 or posx == 0 and posy == 0 or posy == 1 then

      -- local dif = 18
      -- local tot = res - dif

      -- if tot < 0 then

        -- -- failed
        -- thrower. isInBallPosesion = false
        -- local dx = dice(1,2)
        -- local dy = dice(1,2)

        -- if dx > 1 then
          -- Ball.indexBoardPositionAxisx = (receiver.indexBoardPositionAxisx + dx)
        -- elseif dx < 1 then
          -- Ball.indexBoardPositionAxisx = (receiver.indexBoardPositionAxisx + dx)
        -- end -- end forthy if

        -- if dy > 1 then
          -- Ball.indexBoardPositionAxisy = (receiver.indexBoardPositionAxisy + dy)
        -- elseif dy < 1 then
          -- Ball.indexBoardPositionAxisy = (receiver.indexBoardPositionAxisy + dy)
        -- end -- end fhorty if


      -- elseif tot == 0 then

        -- local d8 = dice(1,8)

        -- if d8 < 4 then

          -- -- failed
          -- thrower. isInBallPosesion = false
          -- local dx = dice(1,2)
          -- local dy = dice(1,2)

          -- if dx > 1 then
            -- Ball.indexBoardPositionAxisx = (receiver.indexBoardPositionAxisx + dx)
          -- elseif dx < 1 then
            -- Ball.indexBoardPositionAxisx = (receiver.indexBoardPositionAxisx + dx)
          -- end -- end forthy if

          -- if dy > 1 then
            -- Ball.indexBoardPositionAxisy = (receiver.indexBoardPositionAxisy + dy)
          -- elseif dy < 1 then
            -- Ball.indexBoardPositionAxisy = (receiver.indexBoardPositionAxisy + dy)
          -- end -- end fhorty if

        -- elseif d8 >= 4 then

          -- -- sucessfull
          -- thrower.isInBallPosesion = false
          -- receiver.isInBallPosesion = true

        -- end -- end if fhorty

      -- elseif tot > 0 then

        -- local d8 = dice(1,8)

        -- if d8 <= 2 then

          -- -- failed
          -- thrower. isInBallPosesion = false
          -- local dx = dice(2)
          -- local dy = dice(2)

          -- if dx > 1 then
            -- Ball.indexBoardPositionAxisx = (receiver.indexBoardPositionAxisx + dx)
          -- elseif dx < 1 then
            -- Ball.indexBoardPositionAxisx = (receiver.indexBoardPositionAxisx + dx)
          -- end -- end fifty if

          -- if dy > 1 then
            -- Ball.indexBoardPositionAxisy = (receiver.indexBoardPositionAxisy + dy)
          -- elseif dy < 1 then
            -- Ball.indexBoardPositionAxisy = (receiver.indexBoardPositionAxisy + dy)
          -- end -- end fifty if

        -- elseif d8 > 2 then

          -- -- sucessfull
          -- thrower.isInBallPosesion = false
          -- receiver.isInBallPosesion = true

        -- end -- end if fhorty

      -- end -- end thirty if

    -- end  -- end second if

  -- end -- end first if

-- end -- end function

-- function Hero:calculateStealBall(Attackant, Defender)

  -- local indexBoardPositionAxisx = math.abs((Attackant.indexBoardPositionAxisx - Defender.indexBoardPositionAxisx))
  -- local indexBoardPositionAxisy = math.abs((Attackant.indexBoardPositionAxisy - Defender.indexBoardPositionAxisy))

  -- if indexBoardPositionAxisx == 1 or indexBoardPositionAxisx == 0 and indexBoardPositionAxisy == 1 or indexBoardPositionAxisy == 1 then

    -- local tot = ((Attackant.For+Attackant.Figth) - (Defender.Ability+Defender.Alert))
    -- if tot > 0 then
      -- Attackant.isInBallPosesion = true
      -- Defender.isInBallPosesion = false
    -- end -- end second if

  -- end -- end first if

-- end -- end function

return Hero
