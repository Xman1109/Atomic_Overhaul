data:extend({
	{
		type = "item",
		name = "advanced-MOX-fuel-cell",
		icons =
		{
			{
				icon = graphics .. "MOX-fuel-cell.png",
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
					filename = graphics .. "MOX-fuel-cell.png",
					width = 64,
					height = 64,
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
		order = "c",
		subgroup = "advanced-fuel-cells",
		fuel_category = "space-nuclear-fuel",
		burnt_result = "advanced-MOX-depleted-cell",
		fuel_glow_color = { 118, 150, 57 },
		fuel_value = math.floor(string.gsub(data.raw["item"]["MOX-fuel-cell"].fuel_value, "GJ", "") * 0.75) .. "GJ",
		stack_size = 50
	}
})
