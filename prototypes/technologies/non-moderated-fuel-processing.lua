data:extend({

    {
        type = "technology",
        name = "non-moderated-fuel-processing",
        icon = graphics .. "non-moderated-processing.png",
        icon_size = "256",
        icon_mipmaps = 4,
        prerequisites = data.raw["technology"]["ao-graphite-processing"].prerequisites,
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
        unit = data.raw["technology"]["ao-graphite-processing"].unit
    }

})
