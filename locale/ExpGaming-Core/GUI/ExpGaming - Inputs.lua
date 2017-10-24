--[[
Explosive Gaming

This file can be used with permission but this and the credit below must remain in the file.
Contact a member of management on our discord to seek permission to use our code.
Any changes that you may make to the code are yours but that does not make the script yours.
Discord: https://discord.gg/r6dC2uK
]]
--Please Only Edit Below This Line-----------------------------------------------------------
local ExpGui = require("ExpGaming - Module Setup")
local add_input = ExpGui.add_input
local inputs = ExpGui.inputs
--allows defining of new buttons;;name  how to call button;;default_display  what is shown on the button;;default_tooltip  the tooltip display;;event  function(player,element) that runs on click
function add_input.button(name,default_display,default_tooltip,event)
	if not name then error('Button requires a name') end
	inputs.buttons[name] = {name=name,display=default_display,tooltip=default_tooltip,event=event}
end
--allows defining of text box inputs;;name  how to call button;;default_display  what is shown on the button;;event  function(player,element) that runs on text change
function add_input.text(name,default_display,event)
	if not name then error('Text Filed requires a name') end
	inputs.text[name] = {name=name,display=default_display,event=event}
end
--draws the button into a gui;;frame  the frame to draw to;;name  name of button to draw;;display(opptinal) overrides the default;;tooltip(opptinal) overrides the default
function add_input.draw_button(frame,name,display,tooltip)
	if not frame or not frame.valid then error('No frame to draw to') end
	if not name then error('No button to draw') end
	debug_write({'GUI','INPUT'},name)
	if inputs.buttons[name] then
		local button = inputs.buttons[name]
		local display = display or button.display or {'expgui.button-no-display'}
		local tooltip = tooltip or button.tooltip or {'expgui.button-no-tooltip'}
		if type(display) == 'string' and frame.gui.is_valid_sprite_path(display) then
			frame.add{name=name, type = "sprite-button", sprite=display, tooltip=tooltip, style = mod_gui.button_style}
		else
			frame.add{name=name, type = "button", caption=display, tooltip=tooltip, style = mod_gui.button_style}
		end return
	end
	error('No Button by the name of '..name)
end
--draws the text into a gui;;frame  the frame to draw to;;name  name of button to draw;;display(opptinal) overrides the default;;tooltip(opptinal) overrides the default
function add_input.draw_text(frame,name,display)
	if not frame or not frame.valid then error('No frame to draw to') end
	if not name then error('No text filed to draw') end
	debug_write({'GUI','INPUT'},name)
	if inputs.text[name] then
		local text = inputs.text[name]
		local display = display or text.display or {'expgui.text-no-display'}
		frame.add{name=name, type='textfield'}
		frame[name].caption=display
		return
	end
	error('No Text by the name of '..name)
end
--the magic behind the buttons
Event.register(defines.events.on_gui_click, function(event)
  	local player = game.players[event.player_index]
	if event.element.type == 'button' or event.element.type == 'sprite-button' then
		if inputs.buttons[event.element.name] then
			local button = inputs.buttons[event.element.name]
			if button.event then button.event(player,event.element) 
			else ranking.rank_print('Button without Function '..button.name,'Mod') end
		end
	end
end)
--the magic behind the text inputs
Event.register(defines.events.on_gui_text_changed, function(event)
  	local player = game.players[event.player_index]
	if inputs.text[event.element.name] then
		local text = inputs.text[event.element.name]
		if text.event then text.event(player,event.element) end
	end
end)

return ExpGui