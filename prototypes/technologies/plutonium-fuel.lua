data:extend({

    {
            type = "technology",
            name = "plutonium-fuel",
            icon = graphics .. "plutonium-fuel.png",
            icon_size = "64",
            prerequisites = {"plutonium-processing", "rocket-fuel"},
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
            },
        time = 75
        }
    }
    
})