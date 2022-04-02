data:extend({

    {
            type = "technology",
            name = "MOX-fuel-reprocessing",
            icon = graphics .. "MOX-reprocessing.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = {"MOX-processing"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "MOX-reprocessing"
                }
            },
            unit =
        {
        count = 500,
        ingredients =
            {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1},
              {"chemical-science-pack", 1},
              {"production-science-pack", 1},
              {"research-data", 1},
            },
        time = 45
        }
    }
})