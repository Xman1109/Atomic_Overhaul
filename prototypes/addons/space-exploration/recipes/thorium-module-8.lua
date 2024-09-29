data:extend({
        {
            type = "recipe",
            name = "thorium-module-8",
            icon = se_addon_graphics .. "thorium-module-8.png",
            icon_size = 128,
            icon_mipmaps = 4,
            category = "advanced-crafting",
            enabled = false,
            order = "h",
            group = "production",
            subgroup = "modules",
            energy_required = 40,
            ingredients =
            {
                { "thorium",               30 },
                { "productivity-module-8", 1 },
                { "speed-module-8",        1 }
            },
            results = {
                { "thorium-module-8", 1 }
            }
        },
})

