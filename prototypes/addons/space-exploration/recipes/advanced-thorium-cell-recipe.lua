data:extend(
    {
        {
        type = "recipe",
        name = "advanced-thorium-recipe",
        icon = data.raw["item"]["advanced-thorium-fuel-cell"].icon,
        icon_size = 64, icon_mipmaps = 4,
        icons = data.raw["item"]["advanced-thorium-fuel-cell"].icons,
        category = "space-radiation",
        crafting_machine_tint = cmt.thorium,
        energy_required = 50,
        enabled = false,
        order = "a",
        subgroup = "space-fuel-cells",
        ingredients =
        {
            {type = "item", name = fuel_cell, amount = 10},
            {type = "item", name = "thorium-fuel-rod", amount = 10}
        },
        always_show_made_in = true,
        results = 	{
            {type = "item", name = "advanced-thorium-fuel-cell", amount = 10}
        },
    }
})