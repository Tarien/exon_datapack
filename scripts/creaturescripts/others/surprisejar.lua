local mobs = {
	['rat'] = 200,
	['rabbit'] = 201,
	['deer'] = 202,
	['cat'] = 203,
	['dog'] = 203,
	['husky'] = 204,
	['slime'] = 205
}
local jars = CreatureEvent() 

function jars.onKill(player, target, creature)
	local targetMonster = target:getMonster()
	print("nop")
	if not targetMonster then
		return true
	end

	local targetName = targetMonster:getName():lower()
	local mobStorage = mobs[targetName]
	
	if mobStorage then
		return true
	end
	
	local probability = math.random(0, 10000)
--	if probability > 9980 then
	if probability > 5000 then
		print("yes")
		player:say('You found a Surprise Jar!', TALKTYPE_MONSTER_SAY)
		return player:addItem(32014, 1)
	end
	return true
end

jars:register()


