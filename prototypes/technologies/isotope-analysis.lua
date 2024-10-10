data:extend({
    {
        type = "technology",
        name = "isotope-analysis",
        icon = placeholder_icon,
        icon_size = 64,
        visible_when_disabled = true,
        enabled = false,
        effects = {
            {
                type = "unlock-recipe",
                recipe = "graphite-recipe"
            }
        },
        prerequisites = {"nuclear-power", "advanced-electronics-2"}, --TODO: Add the correct prerequisites
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