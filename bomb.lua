local exports = {}

exports.newBomb = function ()
    local bomb = {}    
	bomb.grid_x = 0
	bomb.grid_y = 0
	bomb.act_x = 0
	bomb.act_y = 0
	bomb.speed = 10
	bomb.initTime = 0
	bomb.timeExplosion = 3
	bomb.lastIconTime = 0
	bomb.iconChange =false
	bomb.iconNumber=1
	bomb.iconRevert=false
	bomb.iconFlag=0.15
	bomb.lastKickBombTime=0
	bomb.kickBombFlag=0.5
	bomb.kickBombDirection="-"
	bomb.img = love.graphics.newImage("/Imagens/bomb1.PNG")

    return bomb
end

return exports