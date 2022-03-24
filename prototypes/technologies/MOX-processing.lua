data:extend({

    {
            type = "technology",
            name = "MOX-processing",
            icon = graphics .. "MOX-processing.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = {"plutonium-fuel-reprocessing"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "MOX-fuel-cell-recipe"
                }
            },
            unit =
        {
        count = 750,
        ingredients =
            {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1},
              {"chemical-science-pack", 1},
              {"research-data", 1},
            },
        time = 75
        }
    }
    
})