data:extend({
    {
            type = "technology",
            name = "thorium-module",
            icon = graphics .. "thorium-module-tech-1.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = {"thorium-processing", "productivity-module", "speed-module"},
            effects =
            {
                {
                   type = "unlock-recipe",
                   recipe = "thorium-module-1"
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
              {"utility-science-pack", 1},
              {"research-data", 1},
            },
        time = 45
        }
    }
    
})