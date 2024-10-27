if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({

        {
            type = "technology",
            name = "non-moderated-fuel-processing",
            icon = graphics .. "non-moderated-processing.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = { "uranium-mining" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "uranium-processing"
                },
                {
                    type = "unlock-recipe",
                    recipe = "centrifuge"
                },
                {
                    type = "unlock-recipe",
                    recipe = "empty-fuel-cell-recipe"
                },
                {
                    type = "unlock-recipe",
                    recipe = "non-moderated-fuel-cell-recipe"
                }
            },
            unit =
            {
                count = 200,
                ingredients =
                {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack",   1 },
                    { "chemical-science-pack",   1 },
                },
                time = 75
            },
            hidden = false,
        }

    })
end
