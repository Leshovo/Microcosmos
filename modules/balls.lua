local Ball = require("modules.ball")

local Balls = class()

function Balls:createBalls(tableAxisesIdtableColorstable, tableDestinytableObject)
	Ball:createBidimensionalObjects(tableAxisesIdtableColorstable, tableDestinytableObject)
end

function Balls:createBall(tableAxisesIdColorstable, tableDestinytableObject)
	Ball:createBidimensionalObject(tableAxisesIdColorstable, tableDestinytableObject)
end

Balls:createBall({4, 4, 1, {0, 255, 0 , 255, primaryColor = 2, secondaryColor = 3}}, {Balls, Ball})
Balls[1].pixelPositionAxisy = Balls[1].boardPositionAxisy[4] + 10
Balls[1].pixelPositionAxisx = Balls[1].boardPositionAxisx[4] + 10

return Balls
