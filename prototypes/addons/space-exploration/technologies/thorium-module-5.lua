data:extend({

        {
            type = "technology",
            name = "thorium-module-5",
            icon = se_addon_graphics .. "thorium-module-5.png",
            icon_size = 128,
            icon_mipmaps = 4,
            prerequisites = { "thorium-module-4", "productivity-module-5", "speed-module-5" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "thorium-module-5"
                }
            },
            unit =
            {
                count = 2500,
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

