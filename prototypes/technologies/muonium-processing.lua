data:extend({
    {
        type = "technology",
        name = "muonium-processing",
        icon = graphics .. "muonium-processing.png",
        icon_size = 128,
        icon_mipmaps = 4,
        effects = {
            -- {
            --     type = "unlock-recipe",
            --     recipe = "muonium-processing"
            -- }
            {
                type = "unlock-recipe",
                recipe = "graphite-processing"
            }
            -- TODO: add recipe for cold fusion reactor
        },
        prerequisites = { "isotope-analysis" },
        unit = {
            count = 100,
            ingredients = {
                { "automation-science-pack", 1 },
                { "logistic-science-pack", 1 },
                { "chemical-science-pack", 1 }
            },
            time = 30
        },
        order = "a-a"
    }
})