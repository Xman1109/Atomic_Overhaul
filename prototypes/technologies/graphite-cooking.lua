if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({

        {
            type = "technology",
            name = "graphite-cooking",
            icon = graphics .. "heat-furnace-technology.png",
            icon_size = "256",
            icon_mipmaps = 4,
            prerequisites = { "non-moderated-fuel-reprocessing" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "graphite-furnace-recipe"
                },
                {
                    type = "unlock-recipe",
                    recipe = "heat-furnace-recipe"
                }
            },
            unit =
            {
                count = 250,
                ingredients =
                {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack",   1 },
                    { "chemical-science-pack",   1 },
                },
                time = 75
            }
        }

    })
end
