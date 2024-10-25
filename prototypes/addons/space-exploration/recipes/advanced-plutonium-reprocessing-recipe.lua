data:extend(
{
    {
        type = "recipe",
        name = "advanced-plutonium-reprocessing-recipe",
        icon = data.raw["recipe"]["plutonium-fuel-cell-recipe"].icon,
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
        order = "b",
        subgroup = "advanced-reprocessing",
        ingredients =
        {
            {type = "item", name = "advanced-plutonium-fuel-cell", amount = 5}
        },
        results = data.raw["recipe"]["plutonium-without-research-data"].results,
    }
})