data:extend({

    {
            type = "technology",
            name = "thorium-fuel-reprocessing",
            icon = graphics .. "thorium-reprocessing.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = {"thorium-processing"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "thorium-fuel-reprocessing"
                }
            },
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
              {"research-data", 1},
            },
        time = 45
        }
    }
})