data:extend(
    {
        {
        type = "recipe",
        name = "holmium-fuel-cell-recipe",
        icon = se_addon_graphics .. "holmium-fuel-cell.png",
        icon_size = 64, icon_mipmaps = 4,
        category = "space-radiation",
        crafting_machine_tint = cmt.holmium,
        energy_required = 50,
        enabled = false,
        order = "zb",
        subgroup = "fuel-cells",
        ingredients =
        {
            {type = "item", name = fuel_cell, amount = 10},
            {type="item", name="holmium-fuel-rod", amount=10}
        },
        always_show_made_in = true,
        results = 	{
            {type="item", name="holmium-fuel-cell", amount=10},
        },
    }
})