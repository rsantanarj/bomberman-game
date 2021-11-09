Player = require('player')
Bomb = require('bomb')
Monster = require('monster')
back_sound = love.audio.newSource('game.mp3', 'static')
function love.load()
	itens = {kick_bomb=1, rollerblades=2,fire_bomb_1=3,fire_bomb_2=4, ghost=5, superbomb=6,qtdBomb=7}
	players = {}
	createPlayers()
	monsters = { }
	informations = {}
	
	monsters[1] = Monster.newMonster(288,192,2,false, "/Imagens/monster1.PNG",1)
	monsters[2] = Monster.newMonster(64,256,1,false, "/Imagens/monster1.PNG",6)
	monsters[3] = Monster.newMonster(64,512,3,false, "/Imagens/monster1.PNG",3)
	monsters[4] = Monster.newMonster(352,192,3,false, "/Imagens/monster1.PNG",5)
	monsters[5] = Monster.newMonster(160,512,2,false, "/Imagens/monster1.PNG",8)
	monsters[6] = Monster.newMonster(704,96,3,false, "/Imagens/monster1.PNG",2)
	monsters[7] = Monster.newMonster(640,448,1,false, "/Imagens/monster1.PNG",4)
	monsters[8] = Monster.newMonster(576,192,3,false, "/Imagens/monster1.PNG",7)
	monsters[9] = Monster.newMonster(384,384,0.5,false, "/Imagens/monster1.PNG",1)
	colorMonsters={0, 255, 255, 125}
	--teste = #(player.bomb)
	--0: Blank space
	--1: Block
	--2: Stone
	--3: bomb
	--4: player
	--5: monster
	map = {
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		{ 1, 0, 0, 2, 2, 0, 2, 0, 0, 2, 2, 2, 0, 2, 2, 0, 2, 0, 0, 2, 2, 2, 1 },
		{ 1, 0, 1, 2, 1, 0, 1, 2, 1, 2, 1, 0, 1, 2, 1, 0, 1, 0, 1, 2, 1, 0, 1 },
		{ 1, 0, 0, 2, 0, 2, 0, 2, 0, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 1 },
		{ 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 },
		{ 1, 2, 2, 0, 2, 2, 0, 0, 0, 2, 0, 0, 0, 2, 2, 2, 0, 0, 0, 2, 2, 0, 1 },
		{ 1, 0, 1, 2, 1, 0, 1, 2, 1, 0, 1, 2, 1, 2, 1, 0, 1, 2, 1, 2, 1, 2, 1 },
		{ 1, 0, 0, 0, 0, 0, 2, 0, 0, 2, 0, 0, 2, 2, 0, 0, 2, 0, 0, 2, 0, 2, 1 },
		{ 1, 2, 1, 0, 1, 0, 1, 0, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 },
		{ 1, 0, 2, 0, 2, 0, 0, 2, 2, 0, 0, 2, 0, 2, 2, 0, 0, 2, 0, 0, 0, 2, 1 },
		{ 1, 2, 1, 2, 1, 2, 1, 0, 1, 2, 1, 0, 1, 2, 1, 0, 1, 2, 1, 2, 1, 0, 1 },
		{ 1, 0, 0, 2, 2, 2, 0, 0, 2, 0, 0, 0, 0, 0, 2, 2, 0, 0, 2, 0, 0, 2, 1 },
		{ 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 2, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 },
		{ 1, 2, 2, 0, 2, 0, 0, 0, 2, 0, 2, 0, 2, 0, 2, 2, 2, 0, 0, 0, 2, 2, 1 },
		{ 1, 0, 1, 0, 1, 0, 1, 2, 1, 2, 1, 0, 1, 2, 1, 0, 1, 2, 1, 0, 1, 0, 1 },
		{ 1, 0, 2, 0, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 0, 2, 0, 0, 2, 0, 0, 1 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
	}
	
	mapItem = {
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 },
		{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }
		}	
	--createMapItem()
		
	sideSquare=32
	
	for i=1, #players do 
		map[players[i].grid_y/sideSquare][players[i].grid_x/sideSquare]=4
	end
	
	gameOver=false
	createItens()
	msgGameOver=""
	tempo = newTime(0, 0)
	lastTimeBlockDown = 0
	iBlockDown = 2
	jBlockDown = 2
	kBlock = 1
	blockReverse = false 
	love.audio.play(back_sound)
end

function timeFinishing()
	local currentTime = love.timer.getTime()
	if(gameTimeResult > (5/10))then
		if(totalSeconds > 300)then
			if(blockReverse==false)then
				map[iBlockDown][jBlockDown]=1
				if(jBlockDown + kBlock < #map[iBlockDown])then
					jBlockDown = jBlockDown + 1
				elseif(iBlockDown + kBlock < #map)then
					iBlockDown = iBlockDown + 1
				else
					blockReverse = true
				end
			else	
				map[iBlockDown][jBlockDown]=1
				if(jBlockDown - kBlock > 1)then
					jBlockDown = jBlockDown - 1
				elseif(iBlockDown - kBlock > 1)then
					if(jBlockDown - kBlock == 1)then
						kBlock = kBlock + 1						
					end
					iBlockDown = iBlockDown - 1
				else
					blockReverse = false
				end
			end
		end
		lastTimeBlockDown = currentTime
	end
end	
 
function createPlayers()
	player1 = Player.newPlayer(64, 64,"/Imagens/player1_moveDown.PNG")
	player2 = Player.newPlayer(704, 512,"/Imagens/player2_moveUp.PNG")
	
	table.insert(players, player1)
	table.insert(players, player2)
 end
 
function love.update(dt)
	for i=1, #players do 
		players[i].act_y = players[i].act_y - ((players[i].act_y - players[i].grid_y) * players[i].speed * dt)
		players[i].act_x = players[i].act_x - ((players[i].act_x - players[i].grid_x) * players[i].speed * dt)
		if(existCollision(0, 0, players[i], 1))then
			msgGameOver="Fim de jogo - player "..i.." perdeu."
			gameOver = true
		end
		if(players[i].iconDirection~="-")then
			animationMovement(players[i],i)
		end
		cancelIconDirection(players[i],i)
		
		if(#players[i].bomb>0)then
			for j=#players[i].bomb,1,-1 do 
				players[i].bomb[j].act_y = players[i].bomb[j].act_y - ((players[i].bomb[j].act_y - players[i].bomb[j].grid_y) * players[i].bomb[j].speed * dt)
				players[i].bomb[j].act_x = players[i].bomb[j].act_x - ((players[i].bomb[j].act_x - players[i].bomb[j].grid_x) * players[i].bomb[j].speed * dt)
			
				if(players[i].bomb[j].kickBombDirection~="-")then
					kickBomb(players[i].bomb[j])
				end		
			end
		end
	end
	for i=1, #monsters do 
		monsters[i].act_y = monsters[i].act_y - ((monsters[i].act_y - monsters[i].grid_y) * monsters[i].speed * dt)
		monsters[i].act_x = monsters[i].act_x - ((monsters[i].act_x - monsters[i].grid_x) * monsters[i].speed * dt)
		
		--if(i ~= #monsters)then --o ultimo monstro faz movimento retangular
			local currentTime = love.timer.getTime()
			local timeResult = math.floor(currentTime - monsters[i].lastMovementTime)
			key = love.math.random(1, 4)	
			monsterAleatoryMovement(monsters[i], timeResult, key)
			animationMovementMonster(monsters[i])
		--end
	end	
	informations = {["teste:"]=teste, 
					["player[1].grid_x:"]=players[1].grid_x, 
					["player[1].grid_y:"]=players[1].grid_y, 
					["player[1].qtdBombs:"]=players[1].qtdBombs, 
					["player[1].bombDistanceExplosion:"]=players[1].bombDistanceExplosion, 
					["player[1].speed:"]=players[1].speed, 
					["player[1].kick_bombs:"]=tostring(players[1].kick_bombs), 
					["player[1].isGhost:"]=tostring(players[1].isGhost), 
					["player[1].hasSuperBomb:"]=tostring(players[1].hasSuperBomb)
	}
	--teste = player.act_x.."----"..player.act_y
	gameOverByMonster()
	minutes, seconds = tempo.add(dt)

	totalSeconds = 60* minutes + seconds
	
	local currentTime = love.timer.getTime()
	
	--local timeResult = currentTime - object.lastIconTime
	gameTimeResult = currentTime- lastTimeBlockDown
	teste = gameTimeResult
	timeFinishing()
	for i=#monsters,1,-1 do
		if(existCollision(0, 0, monsters[i], 1))then
			map[(monsters[i].grid_y / sideSquare)][(monsters[i].grid_x / sideSquare)] = 1
			table.remove(monsters,i)
		end
	end
	if(gameOver==true)then
		love.audio.stop(back_sound)
	end
end

function gameOverByMonster()
	for i=1, #monsters do 
		for j=1, #players do 
			if(players[j].grid_x==monsters[i].grid_x and players[j].grid_y==monsters[i].grid_y)then
				msgGameOver="Fim de jogo - player "..j.." perdeu."
				gameOver = true
			end
		end
	end
end
 
function love.draw()
	if(gameOver==false) then
		createMap()
		setMonsters()
		for i=1, #players do 
			setPlayer(players[i])
			if(#players[i].bomb>0)then
				for j=#players[i].bomb,1,-1 do 
					setBomb(players[i].bomb[j])
				end
			end
		end
		explosion()
		
		--printInformations()
		--printMap()
	else
		love.graphics.print(msgGameOver, love.graphics.getWidth()/2 - 40, love.graphics.getHeight()/2 - 5)
	end
	if(gameOver==false)then
		printTime()
	end
end

function printTime()
	if minutes >= 10 and seconds >= 10 then
		love.graphics.print(minutes .. ":" .. seconds, 12, 12, 0, 1, 1)
	elseif minutes >= 10 then
		love.graphics.print(minutes .. ":0"  .. seconds, 12, 12, 0, 1, 1)
	elseif seconds >= 10 then
		love.graphics.print("0" .. minutes .. ":" .. seconds, 12, 12, 0, 1, 1)
	else
		love.graphics.print("0" .. minutes .. ":0" .. seconds, 12, 12, 0, 1, 1)
	end
end

function printInformations()
	love.graphics.setColor(255, 255, 255)
	local x = 530
	local y = 60
	for key,value in pairs (informations) do 
		love.graphics.print(key.." "..value,x,y)
		y=y+20
	end
end

function cancelIconDirection(object,i)
	if(object.iconDirection=="Up")then
		if(object.act_y<=(object.grid_y+4))then
			object.img = love.graphics.newImage("/Imagens/player"..i.."_move"..object.iconDirection..".PNG")
			object.iconDirection="-"	
		end
	elseif(object.iconDirection=="Down")then
		if(object.act_y>=(object.grid_y-4))then
			object.img = love.graphics.newImage("/Imagens/player"..i.."_move"..object.iconDirection..".PNG")
			object.iconDirection="-"	
		end
	elseif(object.iconDirection=="Left")then
		if(object.act_x<=(object.grid_x+4))then
			object.img = love.graphics.newImage("/Imagens/player"..i.."_move"..object.iconDirection..".PNG")
			object.iconDirection="-"	
		end
	elseif(object.iconDirection=="Right")then
		if(object.act_x>=(object.grid_x-4))then
			object.img = love.graphics.newImage("/Imagens/player"..i.."_move"..object.iconDirection..".PNG")
			object.iconDirection="-"	
		end
	end
end
 
function animationMovement(object,i)
	local currentTime = love.timer.getTime()
	local timeResult = currentTime - object.lastIconTime
	
	if(timeResult > object.iconFlag)then
		object.img = love.graphics.newImage("/Imagens/player"..i.."_move"..object.iconDirection..object.iconNumber..".PNG")
		if(object.iconNumber==1)then
			object.iconNumber=object.iconNumber+1
		else
			object.iconNumber=object.iconNumber-1
		end
		object.lastIconTime = love.timer.getTime()
	end
end

function animationMovementMonster(monster)
	local currentTime = love.timer.getTime()
	local timeResult = currentTime - monster.lastIconTime
	
	if(timeResult > monster.iconFlag)then
		monster.img = love.graphics.newImage("/Imagens/monster"..monster.iconNumber..".PNG")
		monster.iconNumber = monster.iconNumber + 1
		if(monster.iconNumber>8)then
			monster.iconNumber=1
		end
		monster.lastIconTime = love.timer.getTime()
	end
end

--1:kick bomb
--2:rollerblades
--3:fire bomb 1
--4:fire bomb 2
--5:ghost
--6:superbomb
function createItens()
	createItem(itens.kick_bomb)
	createItem(itens.kick_bomb)
	createItem(itens.kick_bomb)
	createItem(itens.kick_bomb)
	createItem(itens.rollerblades)
	createItem(itens.rollerblades)
	createItem(itens.rollerblades)
	createItem(itens.rollerblades)
	createItem(itens.rollerblades)
	createItem(itens.rollerblades)
	createItem(itens.fire_bomb_1)
	createItem(itens.fire_bomb_1)
	createItem(itens.fire_bomb_1)
	createItem(itens.fire_bomb_1)
	createItem(itens.fire_bomb_1)
	createItem(itens.fire_bomb_1)
	createItem(itens.fire_bomb_1)
	createItem(itens.fire_bomb_1)
	createItem(itens.fire_bomb_2)
	createItem(itens.fire_bomb_2)
	createItem(itens.fire_bomb_2)
	createItem(itens.fire_bomb_2)
	createItem(itens.fire_bomb_2)
	createItem(itens.ghost)
	createItem(itens.ghost)
	createItem(itens.ghost)
	createItem(itens.superbomb)
	createItem(itens.superbomb)
	createItem(itens.superbomb)
	createItem(itens.superbomb)
	createItem(itens.qtdBomb)
	createItem(itens.qtdBomb)
	createItem(itens.qtdBomb)
	createItem(itens.qtdBomb)
	createItem(itens.qtdBomb)
	createItem(itens.qtdBomb)
	createItem(itens.qtdBomb)
	createItem(itens.qtdBomb)
end

function createItem(item)
	while(true) do
		local x = love.math.random(1, #map[1])
		local y = love.math.random(1, #map)
		if(map[y][x]==2)then
			mapItem[y][x]=item
			break
		end
	end
end

function kickBomb(bomb)
	local currentTime = love.timer.getTime()
	local timeResult = currentTime - bomb.lastKickBombTime
	if (timeResult > bomb.kickBombFlag)then
		if(bomb.kickBombDirection=="UP")then
			kickedBomb(bomb,0,-1)
		elseif(bomb.kickBombDirection=="DOWN")then
			kickedBomb(bomb,0,1)
		elseif(bomb.kickBombDirection=="LEFT")then
			kickedBomb(bomb,-1,0)
		elseif(bomb.kickBombDirection=="RIGHT")then
			kickedBomb(bomb,1,0)
		end
	end
end

function kickedBomb(bomb,x,y)
	--local collidedWithPlayer = false
	if (not noCollision(x, y, bomb)) then
			bomb.kickBombDirection="-"
	else
		--[[for i=1, #players do
			if((players[i].grid_y / sideSquare) + y == bomb.grid_y/sideSquare and (players[i].grid_x / sideSquare) + x ==bomb.grid_x/sideSquare)  then
				collidedWithPlayer = true
			end
		end
		if(collidedWithPlayer==false)then--]]
			map[bomb.grid_y/sideSquare][bomb.grid_x/sideSquare]=0
			if(bomb.kickBombDirection=="UP")then
				bomb.grid_y = bomb.grid_y - sideSquare
			elseif(bomb.kickBombDirection=="DOWN")then
				bomb.grid_y = bomb.grid_y + sideSquare
			elseif(bomb.kickBombDirection=="LEFT")then
				bomb.grid_x = bomb.grid_x - sideSquare
			elseif(bomb.kickBombDirection=="RIGHT")then
				bomb.grid_x = bomb.grid_x + sideSquare	
			end
			map[bomb.grid_y/sideSquare][bomb.grid_x/sideSquare]=3
		--end
	end
end

function setPlayer(prPlayer)
	love.graphics.draw(prPlayer.img, prPlayer.act_x, prPlayer.act_y)
end

function setMonsters()
	local i=1
	for i=1, #monsters do 
		--love.graphics.setColor(colorMonsters)
		--love.graphics.rectangle("fill", monsters[i].act_x, monsters[i].act_y, sideSquare, sideSquare)	
		love.graphics.draw(monsters[i].img, monsters[i].act_x, monsters[i].act_y)
		--love.graphics.draw(love.graphics.newImage("/Imagens/item_kick_bomb.PNG"), x * sideSquare, y * sideSquare)
	end
end

function setBomb(bomb)
	local currentTime = love.timer.getTime()
	if(bomb.iconChange==false) then
		bomb.lastIconTime = love.timer.getTime()
		bomb.iconChange=true
	end
	local timeResult = currentTime - bomb.lastIconTime
	if (timeResult > bomb.iconFlag)then
		bomb.img = love.graphics.newImage("/Imagens/bomb"..bomb.iconNumber..".PNG")
		bomb.iconChange=false	
		--control for animate of bomb
		if(bomb.iconRevert==false)then
			if(bomb.iconNumber<=3) then
				if(bomb.iconNumber==3)then
					bomb.iconRevert=true
				else
					bomb.iconNumber=bomb.iconNumber+1
				end
			end
		else
			if(bomb.iconNumber>=1) then
				if(bomb.iconNumber==1)then
					bomb.iconRevert=false
				else
					bomb.iconNumber=bomb.iconNumber-1
				end
			end
		end
	end
	if(timeResult>bomb.timeExplosion) then
		bomb.iconRevert=false
		bomb.iconChange=false
		bomb.iconNumber=1
	end
	love.graphics.draw(bomb.img, bomb.act_x, bomb.act_y)
end

function createMap()
	img_map_block = love.graphics.newImage("/Imagens/map_block.PNG")
	img_map_stone = love.graphics.newImage("/Imagens/map_stone.PNG")
	img_blank_space = love.graphics.newImage("/Imagens/map_blank_space.PNG")
	for y=1, #map do
		for x=1, #map[y] do
			if map[y][x] == 1 then
				love.graphics.draw(img_map_block, x * sideSquare,y * sideSquare)
			elseif map[y][x] == 2 then
				love.graphics.draw(img_map_stone, x * sideSquare, y * sideSquare)
			elseif(map[y][x] == 0)then
				if (mapItem[y][x] == itens.kick_bomb) then
					love.graphics.draw(love.graphics.newImage("/Imagens/item_kick_bomb.PNG"), x * sideSquare, y * sideSquare)
				elseif (mapItem[y][x] == itens.rollerblades) then
					love.graphics.draw(love.graphics.newImage("/Imagens/item_rollerblades.PNG"), x * sideSquare, y * sideSquare)
				elseif (mapItem[y][x] == itens.fire_bomb_1) then
					love.graphics.draw(love.graphics.newImage("/Imagens/item_fire_bomb1.PNG"), x * sideSquare, y * sideSquare)
				elseif (mapItem[y][x] == itens.fire_bomb_2) then
					love.graphics.draw(love.graphics.newImage("/Imagens/item_fire_bomb2.PNG"), x * sideSquare, y * sideSquare)
				elseif (mapItem[y][x] == itens.ghost) then
					love.graphics.draw(love.graphics.newImage("/Imagens/item_ghost.PNG"), x * sideSquare, y * sideSquare)
				elseif (mapItem[y][x] == itens.superbomb) then
					love.graphics.draw(love.graphics.newImage("/Imagens/item_super_bomb.PNG"), x * sideSquare, y * sideSquare)
				elseif (mapItem[y][x] == itens.qtdBomb) then
					love.graphics.draw(love.graphics.newImage("/Imagens/item_bomb.PNG"), x * sideSquare, y * sideSquare)
				end
			end
			if((map[y][x] == 4 or map[y][x] == 0 or map[y][x] == 3 or map[y][x] == 5)and mapItem[y][x]==0)then
				love.graphics.draw(img_blank_space, x * sideSquare, y * sideSquare)
			end
		end
	end
end

function printMap()
	local y,x
	for y=1, #map do
		for x=1, #map[y] do
			if x==1 then
				love.graphics.print("{ " .. map[y][x] .. ", ",520+(x*15),240+(y*10))	
				love.graphics.print("{ " .. mapItem[y][x] .. ", ",520+(x*15),380+(y*10))	
			elseif x==#map[y] then
				love.graphics.print(", " .. map[y][x] .. "}",520+(x*15),240+(y*10))	
				love.graphics.print(", " .. mapItem[y][x] .. "}",520+(x*15),380+(y*10))	
			else 
				love.graphics.print(", " .. map[y][x] .. " ",520+(x*15),240+(y*10))	
				love.graphics.print(", " .. mapItem[y][x] .. " ",520+(x*15),380+(y*10))	
			end
		end
	end
end 

--todo: refatorar
function love.keypressed(key)
	if key == "w" then
		movePlayer(players[1],0,-1,"UP","/Imagens/player1_moveUp.PNG")
	elseif key == "s" then
		movePlayer(players[1],0,1,"DOWN","/Imagens/player1_moveDown.PNG")
	elseif key == "a" then
		movePlayer(players[1],-1,0,"LEFT","/Imagens/player1_moveLeft.PNG")
	elseif key == "d" then
		movePlayer(players[1],1,0,"RIGHT","/Imagens/player1_moveRight.PNG")
	elseif key == "space" then
		if(#players[1].bomb < players[1].qtdBombs) then
			--if player isnt on the block
			if (not existCollision(0, 0, players[1], 2)) then
				local aux = #players[1].bomb+1
				players[1].bomb[aux]=Bomb.newBomb()		
				players[1].bomb[aux].grid_x=players[1].grid_x 
				players[1].bomb[aux].grid_y=players[1].grid_y
				players[1].bomb[aux].act_x=players[1].bomb[aux].grid_x
				players[1].bomb[aux].act_y=players[1].bomb[aux].grid_y
				map[players[1].bomb[aux].grid_y/sideSquare][players[1].bomb[aux].grid_x/sideSquare]=3	
				players[1].bomb[aux].initTime = love.timer.getTime()
				--player.qtdBombs=player.qtdBombs+1
			end
		end
	elseif key == "up" then
		movePlayer(players[2],0,-1,"UP","/Imagens/player2_moveUp.PNG")
	elseif key == "down" then
		movePlayer(players[2],0,1,"DOWN","/Imagens/player2_moveDown.PNG")
	elseif key == "left" then
		movePlayer(players[2],-1,0,"LEFT","/Imagens/player2_moveLeft.PNG")
	elseif key == "right" then
		movePlayer(players[2],1,0,"RIGHT","/Imagens/player2_moveRight.PNG")
	elseif key == "return" then
		if(#players[2].bomb < players[2].qtdBombs) then
			--if player isnt on the block
			if (not existCollision(0, 0, players[2], 2)) then
				local aux = #players[2].bomb+1
				players[2].bomb[aux]=Bomb.newBomb()		
				players[2].bomb[aux].grid_x=players[2].grid_x 
				players[2].bomb[aux].grid_y=players[2].grid_y
				players[2].bomb[aux].act_x=players[2].bomb[aux].grid_x
				players[2].bomb[aux].act_y=players[2].bomb[aux].grid_y
				map[players[2].bomb[aux].grid_y/sideSquare][players[2].bomb[aux].grid_x/sideSquare]=3	
				players[2].bomb[aux].initTime = love.timer.getTime()
				--player.qtdBombs=player.qtdBombs+1
			end
		end
	end
end

function movePlayer(player,x,y,direction,imgDirection)
	local ibomb = getIndexBombCollision(x, y, player)
	if(ibomb~=0) then
		if(player.kick_bombs)then
			player.bomb[ibomb].kickBombDirection=direction
		end
	
	elseif (not existCollision(x, y, player, 1)) then 
		if (not existCollision(x, y, player, 3)) then
			if (not existCollision(x, y, player, 2) or player.isGhost) then
				player.img = love.graphics.newImage(imgDirection)
				if(not player.isGhost)then
					map[player.grid_y/sideSquare][player.grid_x/sideSquare]=0
				end
				if(direction == "UP")then
					player.grid_y = player.grid_y - sideSquare
					player.iconDirection = "Up"
				elseif(direction == "DOWN")then
					player.grid_y = player.grid_y + sideSquare
					player.iconDirection = "Down"
				elseif(direction == "LEFT")then
					player.grid_x = player.grid_x - sideSquare
					player.iconDirection = "Left"
				elseif(direction == "RIGHT")then
					player.grid_x = player.grid_x + sideSquare
					player.iconDirection = "Right"
				end
				if(not player.isGhost)then
					map[player.grid_y/sideSquare][player.grid_x/sideSquare]=4
				end
			end
		end
	end
	if(existCollision(0, 0, player,6)) then
		setItemForPlayer(player)
	end		
end

function setItemForPlayer(prPlayer)
	local posXPlayer = prPlayer.grid_x / sideSquare
	local posYPlayer = prPlayer.grid_y / sideSquare

	if(mapItem[posYPlayer][posXPlayer]==itens.kick_bomb)then
		prPlayer.kick_bombs=true
	elseif(mapItem[posYPlayer][posXPlayer]==itens.rollerblades)then
		prPlayer.speed = prPlayer.speed+2
	elseif(mapItem[posYPlayer][posXPlayer]==itens.fire_bomb_1)then
		prPlayer.bombDistanceExplosion = prPlayer.bombDistanceExplosion+1
	elseif(mapItem[posYPlayer][posXPlayer]==itens.fire_bomb_2)then
		prPlayer.bombDistanceExplosion = prPlayer.bombDistanceExplosion+2
	elseif(mapItem[posYPlayer][posXPlayer]==itens.ghost)then
		prPlayer.isGhost = true
	elseif(mapItem[posYPlayer][posXPlayer]==itens.superbomb)then
		prPlayer.hasSuperBomb = true
	elseif(mapItem[posYPlayer][posXPlayer]==itens.qtdBomb)then
		prPlayer.qtdBombs = prPlayer.qtdBombs + 1
	end
	mapItem[posYPlayer][posXPlayer]=0
end

function monsterAleatoryMovement(monster, timeResult, key)
	if key == 1 then
		if noCollision(0, -1, monster) then
			if(timeResult > monster.movementTime) then
				moveMonster(monster,"UP")
			end
		end
	elseif key == 2 then
		if noCollision(0, 1, monster) then
			if(timeResult > monster.movementTime) then
				moveMonster(monster,"DOWN")
			end
		end
	elseif key == 3 then
		if noCollision(-1, 0, monster) then
			if(timeResult > monster.movementTime) then
				moveMonster(monster,"LEFT")
			end
		end
	elseif key == 4 then
		if noCollision(1, 0, monster) then
			if(timeResult > monster.movementTime) then
				moveMonster(monster,"RIGHT")
			end
		end
	end
end

function moveMonster(monster, direction)
	map[monster.grid_y/sideSquare][monster.grid_x/sideSquare]=0
	if(direction == "UP")then
		monster.grid_y = monster.grid_y - sideSquare
	elseif(direction == "DOWN")then
		monster.grid_y = monster.grid_y + sideSquare
	elseif(direction == "LEFT")then
		monster.grid_x = monster.grid_x - sideSquare
	elseif(direction == "RIGHT")then
		monster.grid_x = monster.grid_x + sideSquare
	end
	map[monster.grid_y/sideSquare][monster.grid_x/sideSquare]=5
	monster.lastMovementTime=love.timer.getTime()
end

--todo: verificar a utização de colisao com o valueMap=4

--valueMap=1 --> collision of object with blocks
--valueMap=2 --> collision of object with stones
--valueMap=3 --> collision of object with bombs
--valueMap=4 --> collision of object with player
--valueMap=5 --> collision of object with monster
--valueMap=6 --> collision of object with itens
function existCollision(x, y, object, valueMap)
	if(valueMap==5)then
		local i
		for i=1, #monsters do 
			if map[(object.grid_y / sideSquare) + y][(object.grid_x / sideSquare) + x] == valueMap then
				return true
			end
		end
	elseif(valueMap==3)then
		--if(#player.bomb>0)then
			if map[(object.grid_y / sideSquare) + y][(object.grid_x / sideSquare) + x] == valueMap then
				return true
			end
		--end
	elseif(valueMap==6)then			
		if mapItem[(object.grid_y / sideSquare) + y][(object.grid_x / sideSquare) + x] ~=0 then
			return true
		end
	else
		if map[(object.grid_y / sideSquare) + y][(object.grid_x / sideSquare) + x] == valueMap then
			return true
		end
	end
	
	return false
end
 
function noCollision(x, y, object)
	if map[(object.grid_y / sideSquare) + y][(object.grid_x / sideSquare) + x] == 1 or
	   map[(object.grid_y / sideSquare) + y][(object.grid_x / sideSquare) + x] == 2 or 
	   map[(object.grid_y / sideSquare) + y][(object.grid_x / sideSquare) + x] == 5 
	then
		return false
	end
	if(existCollisionWithBomb(x,y,object))then
		return false
	end
	return true
end

--POR ENQUANTO UM PLAYER SO VAI CONSEGUIR CHUTAR SUAS PROPRIAS BOMBAS
function getIndexBombCollision(x, y, object)
	if(#object.bomb>0)then
		for i=#object.bomb,1,-1 do 
			if map[(object.grid_y / sideSquare) + y][(object.grid_x / sideSquare) + x] == 3 then
				return i
			end
		end
	end
	return 0
end

function existCollisionWithBomb(x, y, object)
	for i=1, #players do 
		if(#players[i].bomb>0)then
			for j=#players[i].bomb,1,-1 do 
				if map[(object.grid_y / sideSquare) + y][(object.grid_x / sideSquare) + x] == 3 then
					return true
				end
			end
		end
	end
	return false
end

function explosion()
	for i=1, #players do 
		if(#players[i].bomb>0) then
			for j=#players[i].bomb, 1, -1 do	
				local currentTime = love.timer.getTime()
				local timeResult = math.floor(currentTime - players[i].bomb[j].initTime)
				map[(players[i].bomb[j].grid_y / sideSquare)][(players[i].bomb[j].grid_x / sideSquare)]=3
				if(timeResult > players[i].bomb[j].timeExplosion) then
					explosionCollision(0, 1, players[i].bomb[j],players[i])
					explosionCollision(0, -1, players[i].bomb[j],players[i])
					explosionCollision(1, 0, players[i].bomb[j],players[i])
					explosionCollision(-1, 0, players[i].bomb[j],players[i])
					--When the player is on the bomb
					if(isPlayerOnTheBomb(players[i].bomb[j]))then
						gameOver=true
					end
					players[i].bomb[j].kickBombDirection="-"
					map[(players[i].bomb[j].grid_y / sideSquare)][(players[i].bomb[j].grid_x / sideSquare)] = 0
					table.remove(players[i].bomb, j)
				end
			end
		end
	end
end

function isPlayerOnTheBomb(bomb)
	for i=1, #players do 
		if(bomb.grid_y==players[i].grid_y and bomb.grid_x==players[i].grid_x)then
			msgGameOver="Fim de jogo - player "..i.." perdeu."
			return true
		end
	end
	return false
end

function newTime(m, s)
	return {
		add = function (dt)
			s = s + dt
			if s >= 60 then
				s = s - 60
				m = m + 1
			end
			return m, math.floor(s)
		end
	}
end

function explosionCollision(x, y, bomb,player)
	local i=1
	for i=1, player.bombDistanceExplosion do	
		love.graphics.rectangle("fill", bomb.grid_x  + (x*i*sideSquare),bomb.grid_y + (y*i*sideSquare), sideSquare, sideSquare)
		
		local yi=(bomb.grid_y / sideSquare) + (y*i)
		local xi=(bomb.grid_x / sideSquare) + (x*i)

		--explosion colision with stones
		if map[yi][xi] == 2 
		then	
			map[yi][xi] = 0
			if(not player.hasSuperBomb)then
				break
			end	
		--explosion colision with itens
		elseif mapItem[yi][xi] ~=0 
		then	
			mapItem[yi][xi] = 0
		end		
		--explosion colision with blocks
		if map[yi][xi] == 1 
		then	
			break
		end	
		--explosion colision with players
		for j=1, #players do 
			if(bomb.grid_x +(sideSquare*i*x)==players[j].grid_x and bomb.grid_y +(sideSquare*i*y)==players[j].grid_y)
			then	
				gameOver=true
				msgGameOver="Fim de jogo - player "..j.." perdeu."
			end		
		end
		
		--explosion colision with monsters
		local j
		for j=#monsters,1,-1 do 
			if(bomb.grid_x +(sideSquare*i*x)==monsters[j].grid_x and bomb.grid_y +(sideSquare*i*y)==monsters[j].grid_y)
			then
				map[(monsters[j].grid_y / sideSquare)][(monsters[j].grid_x / sideSquare)] = 0
			    table.remove(monsters, j)
			end		
		end
	end
end
