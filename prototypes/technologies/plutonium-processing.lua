data:extend({

    {
            type = "technology",
            name = "plutonium-processing",
            icon = graphics .. "plutonium-processing.png",
            icon_size = "256",
            prerequisites = {"nuclear-fuel-reprocessing"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "plutonium-fuel-cell-recipe"
                }
            },
            unit =
        {
        count = 300,
        ingredients =
            {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1},
              {"chemical-science-pack", 1},
            },
        time = 75
        }
    }
    
})