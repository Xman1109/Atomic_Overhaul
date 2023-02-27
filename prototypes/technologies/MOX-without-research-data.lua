if settings.startup["complexity-level"].value ~= "simple" then
    data:extend({

        {
            type = "technology",
            name = "MOX-without-research-data",
            icon = graphics .. "MOX-without-research-data.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = { "MOX-fuel-reprocessing" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "MOX-without-research-data"
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