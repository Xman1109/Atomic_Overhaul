data:extend(
    {
        {
        type = "recipe",
        name = "iridium-fuel-cell-recipe",
        icon = se_addon_graphics .. "iridium-fuel-cell.png",
        icon_size = 64, mipmap_count = 4,
        category = "centrifuging",
        energy_required = 50,
        enabled = false,
        order = "aa",
        subgroup = "fuel-cells",
        ingredients =
        {
            {fuel_cell, 10},
            {"iridium-192", 5},
            {"graphite", 3}
        },
        always_show_made_in = true,
        results = 	{
            {"iridium-fuel-cell", 10},
        },
    }
})