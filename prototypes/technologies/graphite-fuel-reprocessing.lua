if settings.startup["complexity-level"].value ~= "simple" then
    data:extend({

        {
            type = "technology",
            name = "graphite-fuel-reprocessing",
            icon = graphics .. "graphite-reprocessing.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = { "nuclear-power" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "graphite-fuel-reprocessing"
                }
            },
            unit =
            {
                count = 150,
                ingredients =
                {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack",   1 },
                    { "chemical-science-pack",   1 },
                },
                time = 45
            }
        }

    })
end