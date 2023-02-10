data:extend({
	{
		type = "item",
		name = "advanced-plutonium-fuel-cell",
		icons =
		{
			{
				icon = graphics .. "plutonium-fuel-cell.png",
				icon_size = 64,
				icon_mipmaps = 4
			},
			zero_g_icon
		},
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
				},
				zero_g_picture
			}
		},
		group = "atomic-overhaul",
		order = "b",
		subgroup = "fuel-cells",
		fuel_category = "space-nuclear-fuel",
		burnt_result = "advanced-plutonium-depleted-cell",
		fuel_glow_color = { 130, 187, 124 },
		fuel_value = math.floor(string.gsub(data.raw["item"]["plutonium-fuel-cell"].fuel_value, "GJ", "") * 0.75) .. "GJ",
		stack_size = 50
	}
})
