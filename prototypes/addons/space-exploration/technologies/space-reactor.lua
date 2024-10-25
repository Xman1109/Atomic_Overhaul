data:extend({

    {
        type = "technology",
        name = "space-reactor",
        icon = se_addon_graphics .. "space-reactor-tech.png",
        icon_size = 320,
        icon_mipmaps = 4,
        prerequisites = { "thorium-fuel-reprocessing", "se-energy-science-pack-1", "se-material-science-pack-1" },
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "space-reactor-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "advanced-fuel-cell-recipe"
            }
        },
        unit =
        {
            count = 1000,
            ingredients =
            {
                { "automation-science-pack",    1 },
                { "logistic-science-pack",      1 },
                { "chemical-science-pack",      1 },
                { "se-rocket-science-pack",     1 },
                { "se-energy-science-pack-1",   1 },
                { "se-material-science-pack-1", 1 },
                { "research-data",              1 },
            },
            time = 100
        }
    }
})
