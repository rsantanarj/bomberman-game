local exports = {}

exports.newMonster = function (prGridX,prGridY,prMovementTime,prIsMovementRec,prImg, prIconNumberInitial)
    local monster = {} 
	local bombs = {}
    monster.grid_x = prGridX
	monster.grid_y = prGridY
	monster.img = love.graphics.newImage(prImg)
	monster.movementTime = prMovementTime
	monster.isMovementRec = prIsMovementRec
	monster.act_x = prGridX
	monster.act_y = prGridY
	
	monster.speed = 10
	monster.lastMovementTime = 0
	monster.bomb = bombs
	monster.lastIconTime = 0
	monster.iconFlag = 0.2
	monster.iconNumber = prIconNumberInitial
    return monster
end

return exports
