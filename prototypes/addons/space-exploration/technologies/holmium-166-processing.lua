data:extend({

    {
        type = "technology",
        name = "holmium-166-processing",
        icon = se_addon_graphics .. "holmium-166-processing.png",
        icon_size = "256",
        prerequisites = { "se-processing-holmium", "iridium-192-reprocessing" },
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "holmium-166-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "holmium-rod-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "holmium-fuel-cell-recipe"
            }
        },
        unit =
        {
            count = 3000,
            ingredients =
            {
                { "automation-science-pack",  1 },
                { "logistic-science-pack",    1 },
                { "chemical-science-pack",    1 },
                { "production-science-pack",  1 },
                { "se-rocket-science-pack",   1 },
                { "se-energy-science-pack-1", 1 },
                { "research-data",            1 }
            },
            time = 50
        }
    }
})
