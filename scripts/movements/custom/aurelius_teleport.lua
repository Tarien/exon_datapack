local setting = {
	[60604] = Position(29622, 33084, 5),
	[60605] = Position(29569, 33077, 8)
}
local aurelius_teleport = MoveEvent()
function aurelius_teleport.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local toPosition = setting[item.uid]
	if not toPosition then
		return true
	end

	player:teleportTo(toPosition)
	position:sendMagicEffect(CONST_ME_TELEPORT)
	toPosition:sendMagicEffect(CONST_ME_TELEPORT)
	return true
end

aurelius_teleport:uid(60605, 60604)
aurelius_teleport:register()