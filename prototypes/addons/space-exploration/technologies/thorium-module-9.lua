data:extend({

        {
            type = "technology",
            name = "thorium-module-9",
            icon = se_addon_graphics .. "thorium-module-9.png",
            icon_size = 128,
            icon_mipmaps = 4,
            prerequisites = { "thorium-module-8", "productivity-module-9", "speed-module-9" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "thorium-module-9"
                }
            },
            unit =
            {
                count = 4500,
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

