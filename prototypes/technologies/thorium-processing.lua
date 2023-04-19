if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({

        {
            type = "technology",
            name = "thorium-processing",
            icon = graphics .. "thorium-processing.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = { "MOX-fuel-reprocessing" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "thorium-recipe"
                },
                {
                    type = "unlock-recipe",
                    recipe = "thorium-rod-recipe"
                },
                {
                    type = "unlock-recipe",
                    recipe = "thorium-fuel-cell-recipe"
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
end
