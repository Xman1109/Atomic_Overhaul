data:extend(
{
    {
        type = "recipe",
        name = "advanced-plutonium-reprocessing",
        icon = data.raw["recipe"]["plutonium-fuel-cell"].icon,
        icon_size = 64,
        icon_mipmaps = 4,
        icons = {
            {
                icon = graphics .. "plutonium-without-research-recipe.png",
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
        order = "zzb",
        subgroup = "reprocessing",
        ingredients =
        {
            {"advanced-plutonium-depleted-cell", 5}
        },
        results = data.raw["recipe"]["plutonium-without-research-data"].results,
    }
})