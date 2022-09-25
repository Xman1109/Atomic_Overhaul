data:extend({

    {
        type = "technology",
        name = "plutonium-fuel-reprocessing",
        icon = graphics .. "plutonium-reprocessing.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = { "plutonium-processing" },
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "plutonium-fuel-reprocessing"
            }
        },
        unit =
        {
            count = 100,
            ingredients =
            {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
                { "chemical-science-pack", 1 },
                { "production-science-pack", 1 },
                { "research-data", 1 },
            },
            time = 45
        }
    }
})
