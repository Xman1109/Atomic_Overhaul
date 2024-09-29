data:extend({

        {
            type = "technology",
            name = "thorium-module-8",
            icon = se_addon_graphics .. "thorium-module-8.png",
            icon_size = 128,
            icon_mipmaps = 4,
            prerequisites = { "thorium-module-7", "productivity-module-8", "speed-module-8" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "thorium-module-8"
                }
            },
            unit =
            {
                count = 4000,
                ingredients =
                {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack",   1 },
                    { "chemical-science-pack",   1 },
                    { "production-science-pack", 1 },
                    { "utility-science-pack",    1 },
                    { "research-data",           1 },
                },
                time = 45
            }
        }

})

