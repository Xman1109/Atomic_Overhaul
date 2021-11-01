data:extend({

    {
            type = "technology",
            name = "thorium-fuel-reprocessing",
            icon = graphics .. "group.png",
            icon_size = "128",
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
              {"research-data", 1},
            },
        time = 45
        }
    }
})