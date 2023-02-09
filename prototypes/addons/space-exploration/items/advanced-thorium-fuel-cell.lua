data:extend({
	{
		type = "item",
		name = "advanced-thorium-fuel-cell",
		icon = graphics .. "thorium-fuel-cell.png",
		icon_size = 64, icon_mipmaps = 4,
		pictures =
		{
			layers =
			{
				zero_g_icon,
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
		order = "d",
		subgroup = "fuel-cells",
		fuel_category = "space-nuclear-fuel",
		burnt_result = "advanced-thorium-depleted-cell",
		fuel_glow_color = { 219, 225, 130 },
		fuel_value = math.floor(string.gsub(data.raw["item"]["thorium-fuel-cell"].fuel_value, "GJ", "") * 0.75) .. "GJ",
		stack_size = 50
	}
})
