data:extend(
{
    {
        type = "recipe",
        name = "advanced-thorium-reprocessing",
        icon = data.raw["recipe"]["thorium-fuel-cell"].icon,
        icon_size = 64,
        icon_mipmaps = 4,
        icons = {
            {
                icon = graphics .. "thorium-without-research-recipe.png",
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
        order = "zzd",
        subgroup = "reprocessing",
        ingredients =
        {
            {"advanced-thorium-depleted-cell", 5}
        },
        results = data.raw["recipe"]["thorium-without-research-data"].results,
    }
})