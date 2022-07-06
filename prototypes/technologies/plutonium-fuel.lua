data:extend({

    {
            type = "technology",
            name = "plutonium-fuel",
            icon = graphics .. "plutonium-fuel.png",
            icon_size = "64",
            icon_mipmaps = 4,
            prerequisites = {"plutonium-processing", "kovarex-enrichment-process"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "plutonium-fuel-recipe"
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
              {"production-science-pack", 1},
              {"research-data", 1},
            },
        time = 75
        }
    }
    
})