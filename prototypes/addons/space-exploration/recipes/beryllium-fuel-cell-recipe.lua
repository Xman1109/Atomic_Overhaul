data:extend(
    {
        {
        type = "recipe",
        name = "beryllium-fuel-cell-recipe",
        icon = se_addon_graphics .. "beryllium-fuel-cell.png",
        icon_size = 64, icon_mipmaps = 4,
        category = "space-radiation",
        crafting_machine_tint = cmt.beryllium,
        energy_required = 50,
        enabled = false,
        order = "zc",
        subgroup = "fuel-cells",
        ingredients =
        {
            {fuel_cell, 10},
            {"beryllium-fuel-rod", 10}
        },
        always_show_made_in = true,
        results = 	{
            {"beryllium-fuel-cell", 10},
        },
    }
})