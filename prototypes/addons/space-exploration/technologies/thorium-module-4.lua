data:extend({

        {
            type = "technology",
            name = "thorium-module-4",
            icon = se_addon_graphics .. "thorium-module-4.png",
            icon_size = 128,
            icon_mipmaps = 4,
            prerequisites = { "thorium-module-3", "productivity-module-4", "speed-module-4" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "thorium-module-4"
                }
            },
            unit =
            {
                count = 2000,
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

