data:extend({
    {
        type = "technology",
        name = "X17-weaponry", --TODO
        icon = graphics .. "X17-weaponry.png",
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "graphite-recipe"
            }
        },
        prerequisites = {
            "nuclear-power",
            "kovarex-enrichment-process"
        },
        unit = {
            count = 10000,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1},
                {"production-science-pack", 1},
                {"utility-science-pack", 1},
                {"space-science-pack", 1}
            },
            time = 60
        },
    }
})