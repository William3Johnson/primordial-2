local group = 'general'
local interface = {
    enabled = menu.add_checkbox(group, 'enabled'),
    volume = menu.add_slider(group, 'volume', 0, 100, 1),
    sound = menu.add_text_input(group, 'sound file'),
}

local sound_played = false
local on_paint = function()
    if not interface.enabled:get() then return end
    
    local volume = interface.volume:get() / 100
    local sound = interface.sound:get()

	if menu.is_open() then
		if not sound_played then
			engine.execute_cmd(string.format('playvol %s %s', sound, volume))
			sound_played = true
		end
	else
		sound_played = false
	end
end

callbacks.add(e_callbacks.PAINT, on_paint)
