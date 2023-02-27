data.raw["reactor"]["nuclear-reactor"].use_fuel_glow_color = true
data.raw["reactor"]["nuclear-reactor"].default_fuel_glow_color = { 0, 1, 0, 1 }
if settings.startup["complexity-level"].value ~= "simple" then

	data:extend({
		{
			type = "item",
			name = "thorium-fuel-cell",
			icon = graphics .. "thorium-fuel-cell.png",
			icon_size = 64, icon_mipmaps = 4,
			pictures =
			{
				layers =
				{
					{
						size = 64,
						filename = graphics .. "thorium-fuel-cell.png",
						scale = 0.25,
						mipmap_count = 4
					},
					{
						draw_as_light = true,
						flags = { "light" },
						size = 64,
						filename = base_graphics .. "uranium-fuel-cell-light.png",
						scale = 0.25,
						mipmap_count = 4
					}
				}
			},
			group = "atomic-overhaul",
			order = "e",
			subgroup = "fuel-cells",
			fuel_category = "nuclear",
			burnt_result = "thorium-depleted-cell",
			fuel_glow_color = { 219, 225, 130 },
			fuel_value = "14GJ",
			stack_size = 50
		}
	})
end