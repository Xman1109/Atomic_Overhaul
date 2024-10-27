if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({

        {
            type = "technology",
            name = "non-moderated-fuel-reprocessing",
            icon = graphics .. "non-moderated-reprocessing.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = { "nuclear-power" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "non-moderated-fuel-reprocessing"
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
