if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({

        {
            type = "technology",
            name = "plutonium-without-research-data",
            icon = graphics .. "plutonium-without-research-data.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = { "plutonium-fuel-reprocessing" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "plutonium-without-research-data"
                }
            },
            unit =
            {
                count = 50,
                ingredients =
                {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack",   1 },
                    { "chemical-science-pack",   1 },
                    { "production-science-pack", 1 },
                    { "research-data",           1 },
                },
                time = 45
            }
        }
    })
end
