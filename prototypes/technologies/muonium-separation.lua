data:extend({
    {
        type = "technology",
        name = "muonium-separation",
        icon = graphics .. "muonium-separation.png",
        icon_size = 128,
        icon_mipmaps = 4,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "muonium-separation"
            }
        },
        prerequisites = { "isotope-analysis" },
        unit = {
            count = 5000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
                { "chemical-science-pack", 1 },
                { "production-science-pack", 1 },
                { "utility-science-pack", 1 },
                { "space-science-pack", 1 },
                { "research-data", 1 },
                { "isotope-data", 1 }
            },
            time = 30
        },
        order = "a-a"
    }
})