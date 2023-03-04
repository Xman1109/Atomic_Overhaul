if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({

        {
            type = "technology",
            name = "non-moderated-fuel-reprocessing",
            icon = graphics .. "non-moderated-reprocessing.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = data.raw["technology"]["graphite-fuel-reprocessing"].prerequisites,
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "non-moderated-fuel-reprocessing"
                }
            },
            unit = data.raw["technology"]["graphite-fuel-reprocessing"].unit
        }

    })
end
