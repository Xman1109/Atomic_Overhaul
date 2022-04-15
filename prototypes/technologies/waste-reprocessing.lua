data:extend({
    {
        type = "technology",
        name = "waste-reprocessing",
        icon = graphics .. "waste-reprocessing.png",
        icon_size = 256, --icon_mipmaps = 4,
        prerequisites = {"thorium-fuel-reprocessing"},
        effects =
        {
            {
                type = "unlock-recipe",
                recipe = "waste-liquefaction"
            },
            {
                type = "unlock-recipe",
                recipe = "waste-solution-reprocessing"
            }
        },
        unit =
        {
            count = 5000,
            ingredients =
            {
              {"automation-science-pack", 1},
              {"logistic-science-pack", 1},
              {"chemical-science-pack", 1},
              {"production-science-pack", 1},
              {"utility-science-pack", 1},
              {"research-data", 1},
            },
            time = 60
        },
    }
})