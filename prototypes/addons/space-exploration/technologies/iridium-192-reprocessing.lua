data:extend({

    {
            type = "technology",
            name = "iridium-192-reprocessing",
            icon = se_addon_graphics .. "iridium-192-reprocessing.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = {"iridium-192-processing"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "iridium-192-reprocessing"
                }
            },
            unit =
            {
            count = 2750,
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