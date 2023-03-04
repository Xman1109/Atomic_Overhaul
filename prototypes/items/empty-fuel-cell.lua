if settings.startup["ao-complexity-level"].value ~= "simple" then
	data:extend({
		{
			type = "item",
			name = "empty-fuel-cell",
			icon = graphics .. "empty-fuel-cell.png",
			icon_size = 64,
			icon_mipmaps = 4,
			group = "atomic-overhaul",
			order = "z",
			subgroup = "fuel-cells",
			stack_size = 50,
		}
	})
end
