data:extend({

        {
            type = "technology",
            name = "thorium-module-6",
            icon = se_addon_graphics .. "thorium-module-6.png",
            icon_size = 128,
            icon_mipmaps = 4,
            prerequisites = { "thorium-module-5", "productivity-module-6", "speed-module-6" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "thorium-module-6"
                }
            },
            unit =
            {
                count = 3000,
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

