--[[
Explosive Gaming

This file can be used with permission but this and the credit below must remain in the file.
Contact a member of management on our discord to seek permission to use our code.
Any changes that you may make to the code are yours but that does not make the script yours.
Discord: https://discord.gg/XSsBV6b

The credit below may be used by another script - do not remove.
]]
local credits = {{
	name='Control',
	owner='Explosive Gaming',
	dev='Cooldude2606',
	description='Core Factorio File',
	factorio_version='0.15.23',
	show=false
	}}
local function credit_loop(reg) for _,cred in pairs(reg) do table.insert(credits,cred) end end
--Please Only Edit Below This Line-----------------------------------------------------------
--set up to run other code and events
require("mod-gui")
credit_loop(require("locale/StdLib/event"))
--allows the code to be ran on a map where the code has just been added (ie init after init)
local function init() if not global.credits then Event.dispatch({name = Event.core_events.init, tick = 0}) end end
Event.register(defines.events.on_player_joined_game,init)
Event.register(defines.events.on_tick,init)
--loads all the other scripts
Event.gui_update = script.generate_event_name()
credit_loop(require("locale/file-header"))
--below 'game.tick/(3600*game.speed)) % 15 == 0' raises the gui_update event every 15 minutes - feel free to change the update time
Event.register(defines.events.on_tick, function(event)
	-- +(15/2) splits it into two events every 15 minutes
	if (game.tick/(3600*game.speed)) % 15 == 0 then
		local online_players = #game.connected_players
		for i,player in pairs(game.connected_players) do 
			script.raise_event(Event.gui_update,{tick=game.tick,player=player,player_loop_index=i,players_online=online_players})
		end
	elseif (game.tick/(3600*game.speed))+(15/2) % 15 == 0 then
		for i,player in pairs(game.connected_players) do
			sudo(find_new_rank,{player})
		end
	end
end)
Event.register(-1,function() global.credits = credits end)
