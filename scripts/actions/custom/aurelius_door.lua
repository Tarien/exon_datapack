local aurelius_door = Action()
function aurelius_door.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.Aurelius.AureliusCarpet) >= 1 then
		if item.itemid == 19847 then
			player:teleportTo(toPosition, true)
			item:transform(item.itemid + 1)
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
	end
	return true
end

aurelius_door:aid(60603)
aurelius_door:register()