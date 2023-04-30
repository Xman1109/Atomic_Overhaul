data:extend(
    {
        {
        type = "recipe",
        name = "advanced-plutonium-recipe",
        icon = data.raw["item"]["advanced-plutonium-fuel-cell"].icon,
        icon_size = 64, icon_mipmaps = 4,
        icons = data.raw["item"]["advanced-plutonium-fuel-cell"].icons,
        category = "space-radiation",
        crafting_machine_tint = cmt.plutonium,
        energy_required = 50,
        enabled = false,
        order = "a",
        subgroup = "space-fuel-cells",
        ingredients =
        {
            {fuel_cell, 10},
            {"plutonium-fuel-rod", 10}
        },
        always_show_made_in = true,
        results = 	{
            {"advanced-plutonium-fuel-cell", 10},
        },
    }
})