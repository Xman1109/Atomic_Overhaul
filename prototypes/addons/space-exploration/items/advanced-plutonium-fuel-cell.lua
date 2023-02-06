data:extend({
	{
		type = "item",
		name = "advanced-plutonium-fuel-cell",
		icon = graphics .. "plutonium-fuel-cell.png",
		icon_size = 64, icon_mipmaps = 4,
		pictures =
		{
			layers =
			{
				{
					size = 64,
					filename = graphics .. "plutonium-fuel-cell.png",
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
		order = "c",
		subgroup = "fuel-cells",
		fuel_category = "space-nuclear",
		burnt_result = "advanced-plutonium-depleted-cell",
		fuel_glow_color = { 130, 187, 124 },
		fuel_value = "10GJ",
		stack_size = 50
	}
})
