if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend({
        {
            type = "technology",
            name = "heating-oil",
            icon = graphics .. "heating-oil-tech.png",
            icon_size = 256,
            icon_mipmaps = 4,
            prerequisites = {"nuclear-power"},
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "heating-oil-recipe"
                },
                {
                    type = "unlock-recipe",
                    recipe = "heat-fluid-tank-recipe"
                },
                {
                    type = "unlock-recipe",
                    recipe = "heat-tank-bottling"
                }
            },
            unit =
            {
                count = 500,
                ingredients =
                {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack",   1 },
                    { "chemical-science-pack",   1 },
                    { "production-science-pack", 1 },
                    { "utility-science-pack",    1 },
                },
                time = 45
            }
        }

    })
end
