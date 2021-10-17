data:extend({

    {
            type = "technology",
            name = "plutonium-fuel-reprocessing",
            icon = graphics .. "group.png",
            icon_size = "128",
            prerequisites = {"nuclear-fuel-reprocessing", "plutonium-processing"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "plutonium-fuel-reprocessing"
                }
            },
            unit =
        {
        count = 100,
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