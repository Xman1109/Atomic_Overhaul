data:extend({

    {
            type = "technology",
            name = "holmium-166-reprocessing",
            icon = se_addon_graphics .. "holmium-166-reprocessing.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = {"holmium-166-processing"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "holmium-166-reprocessing"
                }
            },
            unit =
            {
            count = 3000,
            ingredients =
            {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"production-science-pack", 1},
                {"se-rocket-science-pack", 1},
                {"se-energy-science-pack-1", 1},
                {"research-data", 1}
            },
        time = 45
        }
    }
})