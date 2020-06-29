local setting = {
	[60650] = {position = Position(33464, 32866, 8), message = 'Woosh!', premium = false},  --vanguard ocean portal entrance
	[60651] = {position = Position(33374, 32829, 7), message = 'Woosh!', premium = false},  --exit

	-- [50512] = {position = Position(31254, 32604, 9), message = 'Slrrp!', premium = false}, 
	-- [50513] = {position = Position(31061, 32605, 9), message = 'Slrrp!', premium = false}, 

	-- [50514] = {position = Position(33668, 31887, 5), message = 'Slrrp!', premium = false}, 
	-- [50515] = {position = Position(33668, 31887, 5), message = 'Slrrp!', premium = false}, 

	-- [50624] = {position = Position(33668, 31887, 5), message = 'Slrrp!', premium = false}, 
	-- [50625] = {position = Position(33668, 31887, 5), message = 'Slrrp!', premium = false}, 
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local teleport = setting[item.uid]
	if teleport then
		if not player:isPremium() and teleport.premium then
			player:teleportTo(fromPosition)
			player:sendCancelMessage("You need a premium account to access this area.")
			fromPosition:sendMagicEffect(CONST_ME_POFF)
			return true
		end

		player:teleportTo(teleport.position)
		item:getPosition():sendMagicEffect(CONST_ME_GREEN_RINGS)
		player:say(teleport.message, TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	end
	-- return true
end