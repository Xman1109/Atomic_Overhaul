data:extend({

    {
            type = "technology",
            name = "thorium-module-3",
            icon = graphics .. "thorium-module-tech-3.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = {"thorium-module-2", "productivity-module-3", "speed-module-3"},
            effects =
            {
                {
                   type = "unlock-recipe",
                   recipe = "thorium-module-3"
                }
            },
            unit =
        {
        count = 1500,
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