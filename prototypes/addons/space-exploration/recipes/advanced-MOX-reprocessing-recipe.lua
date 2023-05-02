data:extend(
{
    {
        type = "recipe",
        name = "advanced-MOX-reprocessing-recipe",
        icon = data.raw["recipe"]["MOX-fuel-cell-recipe"].icon,
        icon_size = 64,
        icon_mipmaps = 4,
        icons = {
            {
                icon = graphics .. "MOX-without-research-recipe.png",
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
        order = "c",
        subgroup = "advanced-reprocessing",
        ingredients =
        {
            {"advanced-MOX-depleted-cell", 5}
        },
        results = data.raw["recipe"]["MOX-without-research-data"].results,
    }
})