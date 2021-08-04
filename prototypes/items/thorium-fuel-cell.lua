data:extend({
    {
		type = "item",
		name = "thorium-fuel-cell",
		icon = "__Atomic_Overhaul__/graphics/icons/thorium-fuel-cell.png",
		icon_size = 64, icon_mipmaps = 4,
		pictures =
		{
		  layers =
		  {
			{
			  size = 64,
			  filename = "__Atomic_Overhaul__/graphics/icons/thorium-fuel-cell.png",
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
		order = "r[thorium-processing]-a[thorium-fuel-cell]",
		fuel_category = "nuclear",
		burnt_result = "thorium-depleted-cell",
		fuel_value = "36GJ",
		stack_size = 50
	  }
})