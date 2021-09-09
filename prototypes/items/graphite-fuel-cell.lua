data:extend({
    {
		type = "item",
		name = "graphite-fuel-cell",
		icon = graphics .. "graphite-fuel-cell.png",
		icon_size = 64, icon_mipmaps = 4,
		pictures =
		{
		  layers =
		  {
			{
			  size = 64,
			  filename = "__Atomic_Overhaul__/graphics/icons/graphite-fuel-cell.png",
			  scale = 0.25,
			  mipmap_count = 4
			},
			{
			  draw_as_light = true,
			  flags = {"light"},
			  size = 64,
			  filename = "__base__/graphics/icons/uranium-fuel-cell-light.png",
			  scale = 0.25,
			  mipmap_count = 4
			}
		  }
		},
		subgroup = "intermediate-product",
		order = "r[graphite-processing]-a[graphite-fuel-cell]",
		fuel_category = "nuclear",
		burnt_result = "graphite-depleted-cell",
		fuel_value = "3GJ",
		stack_size = 50
	  }
})