local exports = {}

exports.newPlayer = function (prGridX,prGridY,prImg)
    local player = {}    
	local bombs = {}
    player.grid_x = prGridX
	player.grid_y = prGridY
	player.img = love.graphics.newImage(prImg)
	
	player.bombDistanceExplosion = 1
	player.act_x = prGridX
	player.act_y = prGridY
	player.speed = 5
	player.kick_bombs=false
	player.lastIconTime = 0
	player.iconFlag = 0.2
	player.iconNumber = 1
	player.iconDirection = "-"
	player.isGhost = false
	player.hasSuperBomb = false
	player.qtdBombs = 1
	player.bomb = bombs
	
    return player
end

return exports