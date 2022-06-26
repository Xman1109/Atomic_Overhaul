data:extend({

    {
            type = "technology",
            name = "beryllium-7-reprocessing",
            icon = se_addon_graphics .. "beryllium-7-reprocessing.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = {"beryllium-7-processing"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "beryllium-7-reprocessing"
                }
            },
            unit =
            {
            count = 3250,
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