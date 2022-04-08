data:extend({

    {
            type = "technology",
            name = "thorium-module-2",
            icon = graphics .. "thorium-module-tech-2.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = {"thorium-module-1", "productivity-module-2", "speed-module-2"},
            effects =
            {
                {
                   type = "unlock-recipe",
                   recipe = "thorium-module-2"
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