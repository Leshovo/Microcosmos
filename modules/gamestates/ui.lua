require("modules.revised")

local suitlocal = require('suit')
local Timer = require("modules/hump.timer")

local UI = Gamestate.new()


function UI:draw()
	suit.draw()
end


function UI:update(dt)
	buttonsComand = UI:createButtonsComand()
	-- buttonsNumpad = UI:createButtonsNumpad()
	UI.drawComand()
	-- UI.drawNumpad()
  --matrixNumpad()
end


function UI:createButtonsComand()
	Buttons:createLayout{{ axisx = ((halfwidth/2)+70), axisy = 0}, { axisxPadding = 5, axisyPadding = 10}, suit}

  local buttonsComand = {
		A = Button:createButtonInLayoutRow{"A", suit, {width = 40, height = 40}},
		E = Button:createButtonInLayoutCol{"E", suit, {width = 40, height = 40}},
		F = Button:createButtonInLayoutRow{"F", suit, {width = 40, height = 40}},
		B = Button:createButtonInLayoutLeft{"B", suit, {width = 40, height = 40}},
		C = Button:createButtonInLayoutRow{"C", suit, {width = 40, height = 40}},
		G = Button:createButtonInLayoutCol{"G", suit, {width = 40, height = 40}},
		H = Button:createButtonInLayoutRow{"H", suit, {width = 40, height = 40}},
		D = Button:createButtonInLayoutLeft{"D", suit, {width = 40, height = 40}},
		NextTurn = Button:createButtonInLayoutRow{"Next Turn", suit, {width = 90, height = 40}},
		ClearButton = Button:createButtonInLayoutCol{"Clear Comand", suitlocal, {width = 140, height = 40}},
	}

	return buttonsComand
end

-- function UI:createButtonsNumpad()
	-- Buttons:createLayout{{ axisx = (halfwidth-25), axisy = 0}, { axisxPadding = 10, axisyPadding = 10}, suitlocal}

  -- local buttonsNumpad = {
		-- ["7"] = Button:createButtonInLayoutRow{"7", suitlocal, {width = 40, height = 40}},
		-- ["8"] = Button:createButtonInLayoutCol{"8", suitlocal, {width = 40, height = 40}},
		-- ["9"] = Button:createButtonInLayoutCol{"9", suitlocal, {width = 40, height = 40}},
		-- ["6"] = Button:createButtonInLayoutRow{"6", suitlocal, {width = 40, height = 40}},
		-- ["5"] = Button:createButtonInLayoutLeft{"5", suitlocal, {width = 40, height = 40}},
		-- ["4"] = Button:createButtonInLayoutLeft{"4", suitlocal, {width = 40, height = 40}},
		-- ["Void"] = Button:createButtonInLayoutRow{"1", suitlocal, {width = 40, height = 40}},
		-- ["0"] = Button:createButtonInLayoutRow{"0", suitlocal, {width = 140, height = 40}},
		-- ["1"] = Button:createButtonInLayoutUp{"1", suitlocal, {width = 40, height = 40}},
		-- ["2"] = Button:createButtonInLayoutCol{"2", suitlocal, {width = 40, height = 40}},
		-- ["3"] = Button:createButtonInLayoutCol{"3", suitlocal, {width = 40, height = 40}},
    
	-- }

	-- return buttonsNumpad
-- end


function UI.drawComand()
	UI:commandMenu()
end

function  UI:commandMenu()

	if buttonsComand.A.hit then
		ifHitedComand("A")
    
	elseif buttonsComand.B.hit then
		ifHitedComand("B")

  elseif buttonsComand.C.hit then
		ifHitedComand("C")

	elseif buttonsComand.D.hit then
		ifHitedComand("D")

	elseif buttonsComand.E.hit then
		ifHitedComand("E")

	elseif buttonsComand.F.hit then
		ifHitedComand("F")

	elseif buttonsComand.G.hit then
		ifHitedComand("G")

	elseif buttonsComand.H.hit then
		ifHitedComand("H")

  elseif buttonsComand.NextTurn.hit then
    command[1] = ""
    ifHitedComand("NextTurn")
    Timer.after(1, function() command[1] = "" end )

	elseif buttonsComand.ClearButton.hit then
		Comand:clear()
	end

end

function ifHitedComand(commandHited)

	if command.isComandFirstExecution then
		command[1] = command[1] .. commandHited
		command.isComandFirstExecution = false
    
	elseif not command.isComandFirstExecution then
		command[1] = command[1]
		command.isComandFirstExecution = true
    
	end

end


-- function UI.drawNumpad()
	-- UI:numpadMenu()
-- end

-- stringNumpad = ""
-- local isNumpadFirstExecution = false
-- function UI:numpadMenu()

	-- if buttonsNumpad["1"].hit or buttonsNumpad["Void"].hit then
    -- ifHitedNumber(1)

  -- elseif buttonsNumpad["2"].hit then
		-- ifHitedNumber(2)

  -- elseif buttonsNumpad["3"].hit then
		-- ifHitedNumber(3)

	-- elseif buttonsNumpad["4"].hit then
		-- ifHitedNumber(4)

	-- elseif buttonsNumpad["5"].hit then
		-- ifHitedNumber(5)

	-- elseif buttonsNumpad["6"].hit then
		-- ifHitedNumber(6)

	-- elseif buttonsNumpad["7"].hit  then
		-- ifHitedNumber(7)

	-- elseif buttonsNumpad["8"].hit then
		-- ifHitedNumber(8)

	-- elseif buttonsNumpad["9"].hit then
		-- ifHitedNumber(9)

	-- elseif buttonsNumpad["0"].hit then
		-- ifHitedNumber(0)
  -- end

-- end

-- function ifHitedNumber(numberHited)

	-- if isNumpadFirstExecution then
		-- stringNumpad = stringNumpad .. numberHited
		-- isNumpadFirstExecution = false
	-- elseif not isNumpadFirstExecution then
		-- stringNumpad = stringNumpad
		-- isNumpadFirstExecution = true
  -- end  
  
-- end

return UI
