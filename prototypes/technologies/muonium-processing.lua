data:extend({
    {
        type = "technology",
        name = "muonium-processing",
        icon = graphics .. "muonium-processing.png",
        icon_size = 256,
        icon_mipmaps = 4,
        effects = {
            -- {
            --     type = "unlock-recipe",
            --     recipe = "muonium-processing"
            -- }
            {
                type = "unlock-recipe",
                recipe = "cold-fusion-recipe"
            }
        },
        prerequisites = { "muonium-separation" },
        unit = {
            count = 5000,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
                { "chemical-science-pack", 1 },
                { "production-science-pack", 1 },
                { "utility-science-pack", 1 },
                { "research-data", 1 },
                { "isotope-data", 1 }
            },
            time = 30
        },
        order = "a-a"
    }
})