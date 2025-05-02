data:extend({
    {
        type = "technology",
        name = "X17-weaponry",
        icon = graphics .. "X17-weaponry.png",
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "X17-magazine-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "X17-capsule-recipe"
            },
            {
                type = "unlock-recipe",
                recipe = "X17-artillery-shell-recipe"
            }
        },
        prerequisites = {
            "muonium-separation",
            "atomic-bomb"
        },
        unit = {
            count = 5000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack",   1 },
                { "chemical-science-pack",   1 },
                { "military-science-pack",   1 },
                { "production-science-pack", 1 },
                { "utility-science-pack",    1 },
                { "research-data",           1 },
                { "isotope-data",            1 }
            },
            time = 60
        },
    }
})
