if settings.startup["ao-complexity-level"].value ~= "simple" then
    if mods["space-exploration"] and settings.startup["se-addon"].value == true then
        icon = se_addon_graphics .. "thorium-module-2.png"
        icon_size = 128
    else
        icon = graphics .. "thorium-module-tech-2.png"
        icon_size = 256
    end
    data:extend({

        {
            type = "technology",
            name = "thorium-module-2",
            icon = icon,
            icon_size = icon_size,
            icon_mipmaps = 4,
            prerequisites = { "thorium-module", "productivity-module-2", "speed-module-2" },
            effects =
            {
                {
                    type = "unlock-recipe",
                    recipe = "thorium-module-2"
                }
            },
            unit =
            {
                count = 1000,
                ingredients =
                {
                    { "automation-science-pack", 1 },
                    { "logistic-science-pack",   1 },
                    { "chemical-science-pack",   1 },
                    { "production-science-pack", 1 },
                    { "utility-science-pack",    1 },
                    { "research-data",           1 },
                },
                time = 45
            }
        }

    })
end
