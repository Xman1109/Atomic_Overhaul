data:extend({
    {
        type = "technology",
        name = "advanced-fuel-cells",
        icon = se_addon_graphics .. "advanced-fuel-cells.png",
        icon_size = 256,
        icon_mipmaps = 4,
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "advanced-uranium-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "advanced-uranium-reprocessing-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "advanced-plutonium-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "advanced-plutonium-reprocessing-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "advanced-MOX-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "advanced-MOX-reprocessing-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "advanced-thorium-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "advanced-thorium-reprocessing-recipe"
            }
        },
        prerequisites = {"space-reactor"},
        unit =
        {
            count = 1000,
            ingredients =
            {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1},
                {"research-data", 1}
            },
            time = 30
        }
    }
})