data:extend({

    {
            type = "technology",
            name = "graphite-fuel-reprocessing",
            icon = graphics .. "group.png",
            icon_size = "128",
            prerequisites = {"nuclear-power"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "graphite-fuel-reprocessing"
                }
            },
            unit =
        {
        count = 150,
        ingredients =
            {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1},
              {"chemical-science-pack", 1},
            },
        time = 45
        }
    }
    
})