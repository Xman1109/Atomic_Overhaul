if settings.startup["complexity-level"].value ~= "simple" then
    data:extend({
        {
            type = "recipe",
            name = "thorium-module-1",
            icon = graphics .. "thorium-module-1.png",
            icon_size = 64,
            icon_mipmaps = 4,
            category = "advanced-crafting",
            enabled = false,
            order = "a",
            subgroup = "modules",
            energy_required = 40,
            ingredients =
            {
                { "thorium",             10 },
                { "productivity-module", 1 },
                { "speed-module",        1 }
            },
            results = {
                { "thorium-module-1", 1 }
            }
        },
    })
end