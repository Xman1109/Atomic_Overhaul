data:extend({

    {
        type = "technology",
        name = "non-moderated-fuel-reprocessing",
        icon = graphics .. "graphite-reprocessing.png",
        icon_size = 256,
        icon_mipmaps = 4,
        prerequisites = { "nuclear-power", "non-moderated-fuel-processing" },
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
                { "logistic-science-pack", 1 },
                { "chemical-science-pack", 1 },
            },
            time = 45
        }
    }

})
