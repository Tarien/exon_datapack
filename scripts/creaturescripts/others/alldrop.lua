local jarDrop = CreatureEvent("jarDrop")
function jarDrop.onKill(player, target, lastHit)
	-- Monster verify
	if not target:isMonster() or target:getMaster() then
		return true
	end
	local probability = math.random(0, 100)
	if probability < 50 then
		player:say('You found a Surprise Jar!', TALKTYPE_MONSTER_SAY)
		return player:addItem(32014, 1)		
	end
	return true
end
jarDrop:register()

