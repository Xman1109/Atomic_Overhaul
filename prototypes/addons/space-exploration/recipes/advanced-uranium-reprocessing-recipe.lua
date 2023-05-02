data:extend(
{
    {
        type = "recipe",
        name = "advanced-uranium-reprocessing-recipe",
        icon = data.raw["recipe"]["uranium-fuel-cell"].icon,
        icon_size = 64,
        icon_mipmaps = 4,
        icons = {
            {
                icon = graphics .. "uranium-without-research-recipe.png",
                icon_size = 64,
                icon_mipmaps = 4,
            },
            {
                icon = se_addon_graphics .. "zero-g.png",
                icon_size = 64,
                icon_mipmaps = 4,
                scale = 0.5,
            }
        },
        category = "space-radiation",
        energy_required = 60,
        enabled = false,
        order = "a",
        subgroup = "advanced-reprocessing",
        ingredients =
        {
            {"advanced-uranium-depleted-cell", 5}
        },
        results = data.raw["recipe"]["uranium-without-research-data"].results,
    }
})