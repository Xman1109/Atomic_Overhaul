data:extend({

        {
            type = "technology",
            name = "thorium-module-7",
            icon = se_addon_graphics .. "thorium-module-7.png",
            icon_size = 128,
            icon_mipmaps = 4,
            prerequisites = { "thorium-module-6", "productivity-module-7", "speed-module-7" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "thorium-module-7"
                }
            },
            unit =
            {
                count = 3500,
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
