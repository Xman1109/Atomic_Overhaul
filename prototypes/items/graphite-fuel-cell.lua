if settings.startup["ao-complexity-level"].value ~= "simple" then
	data:extend({
		{
			type = "item",
			name = "graphite-fuel-cell",
			icon = graphics .. "graphite-fuel-cell.png",
			icon_size = 64,
			icon_mipmaps = 4,
			pictures =
			{
				layers =
				{
					{
						size = 64,
						filename = graphics .. "graphite-fuel-cell.png",
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
			order = "a",
			subgroup = "fuel-cells",
			fuel_category = "nuclear",
			burnt_result = "graphite-depleted-cell",
			fuel_glow_color = { 71, 71, 82 },
			fuel_value = "3GJ",
			stack_size = 50
		}
	})
end
