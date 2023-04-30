data:extend(
    {
        {
        type = "recipe",
        name = "advanced-uranium-recipe",
        icon = data.raw["item"]["advanced-uranium-fuel-cell"].icon,
        icon_size = 64, icon_mipmaps = 4,
        icons = data.raw["item"]["advanced-uranium-fuel-cell"].icons,
        category = "space-radiation",
        energy_required = 50,
        enabled = false,
        order = "a",
        subgroup = "space-fuel-cells",
        ingredients =
        {
            {fuel_cell, 10},
            {"uranium-fuel-rod", 10}
        },
        always_show_made_in = true,
        results = 	{
            {"advanced-uranium-fuel-cell", 10},
        },
    }
})