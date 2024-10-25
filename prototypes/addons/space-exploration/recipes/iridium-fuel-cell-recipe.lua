data:extend(
    {
        {
        type = "recipe",
        name = "iridium-fuel-cell-recipe",
        icon = se_addon_graphics .. "iridium-fuel-cell.png",
        icon_size = 64, icon_mipmaps = 4,
        category = "space-radiation",
        crafting_machine_tint = cmt.iridium,
        energy_required = 50,
        enabled = false,
        order = "za",
        subgroup = "fuel-cells",
        ingredients =
        {
            {fuel_cell, 10},
            {type="item", name="iridium-fuel-rod", amount=10}
        },
        always_show_made_in = true,
        results = 	{
            {type="item", name="iridium-fuel-cell", amount=10},
        },
    }
})