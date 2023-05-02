data:extend(
{
    {
        type = "recipe",
        name = "advanced-thorium-reprocessing-recipe",
        icon = data.raw["recipe"]["thorium-fuel-cell-recipe"].icon,
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
        order = "d",
        subgroup = "advanced-reprocessing",
        ingredients =
        {
            {"advanced-thorium-depleted-cell", 5}
        },
        results = {
            { "nuclear-waste", 15 },
            { type = "item",   name = "thorium", amount_min = 2, amount_max = 3 },
        }
    }
})