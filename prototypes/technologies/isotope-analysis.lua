data:extend({
    {
        type = "technology",
        name = "isotope-analysis",
        icon = graphics .. "isotope-analysis.png",
        icon_size = 256,
        visible_when_disabled = true,
        enabled = false,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "graphite-furnace-recipe"
            }
        },
        prerequisites = {"nuclear-power", "processing-unit"}, --TODO: Add the correct prerequisites
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1} --TODO: Add the research pack
            },
            time = 30
        }
    }
})