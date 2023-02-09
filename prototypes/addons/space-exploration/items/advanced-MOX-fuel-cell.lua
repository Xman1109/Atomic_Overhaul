data:extend({
	{
		type = "item", -- TODO: Make the icon have the zero g logo + for all the other fuel cells
		name = "advanced-MOX-fuel-cell",
		pictures =
		{
			layers =
			{
				zero_g_icon,
				{
					size = 64,
					filename = graphics .. "MOX-fuel-cell1.png",
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
		fuel_category = "space-nuclear-fuel",
		burnt_result = "advanced-MOX-depleted-cell",
		fuel_glow_color = { 118, 150, 57 },
		fuel_value = math.floor(string.gsub(data.raw["item"]["MOX-fuel-cell"].fuel_value, "GJ", "") * 0.75) .. "GJ",
		stack_size = 50
	}
})
