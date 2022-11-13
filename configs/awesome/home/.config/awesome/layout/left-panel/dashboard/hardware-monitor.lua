local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local cpu_meter = require('widget.cpu-meter')
local ram_meter = require('widget.ram-meter')
local temp_meter = require('widget.temperature-meter')
local hdd_meter = require('widget.harddrive-meter')

local hardware_header = wibox.widget {
	text = 'Hardware Monitor',
	font = 'Inter Regular 12',
	align = 'left',
	valign = 'center',
	widget = wibox.widget.textbox

}

return wibox.widget {
	layout = wibox.layout.fixed.vertical,
	{
		{
			hardware_header,
			left = dpi(24),
			right = dpi(24),
			widget = wibox.container.margin
		},
		bg = beautiful.groups_title_bg,
		shape = function(cr, width, height)
			gears.shape.partially_rounded_rect(cr, width, height, true, true, false, false, beautiful.groups_radius) 
		end,
		forced_height = dpi(35),
		widget = wibox.container.background
		
	},
	{
		{
			layout = wibox.layout.fixed.vertical,
			cpu_meter,
			ram_meter,
			temp_meter,
			hdd_meter
		},
		bg = beautiful.groups_bg,
		shape = function(cr, width, height)
			gears.shape.partially_rounded_rect(cr, width, height, false, false, true, true, beautiful.groups_radius) 
		end,
		widget = wibox.container.background
	}

}
