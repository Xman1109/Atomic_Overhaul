data:extend(
    {
        {
        type = "recipe",
        name = "holmium-fuel-cell-recipe",
        icon = se_addon_graphics .. "holmium-fuel-cell.png",
        icon_size = 64, icon_mipmaps = 4,
        category = "space-radiation",
        energy_required = 50,
        enabled = false,
        order = "zb",
        subgroup = "fuel-cells",
        ingredients =
        {
            {fuel_cell, 10},
            {"holmium-166", 5},
            {"graphite", 3}
        },
        always_show_made_in = true,
        results = 	{
            {"holmium-fuel-cell", 10},
        },
    }
})