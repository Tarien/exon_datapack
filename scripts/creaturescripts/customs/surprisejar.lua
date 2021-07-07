local killEvent = CreatureEvent('newOnKillEvent')
killEvent:type('kill')

function killEvent.onKill(creature, target)
	local player = creature:getPlayer()	
	local targetMonster = target:getMonster()
	if not targetMonster then
		return true
	end
	local probability = math.random(0, 1000)
	if probability > 998 then
		player:say('You found a Surprise Jar!', TALKTYPE_MONSTER_SAY)
		return player:addItem(32014, 1)
	end	
	return true
end

killEvent:register()

local loginEvent = CreatureEvent('registerOnKill')
loginEvent:type('login')

function loginEvent.onLogin(player)
	player:registerEvent('newOnKillEvent')
	return true
end

loginEvent:register()