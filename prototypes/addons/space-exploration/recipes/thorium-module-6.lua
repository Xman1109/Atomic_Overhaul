data:extend({
        {
            type = "recipe",
            name = "thorium-module-6",
            icon = se_addon_graphics .. "thorium-module-6.png",
            icon_size = 128,
            icon_mipmaps = 4,
            category = "advanced-crafting",
            enabled = false,
            order = "f",
            group = "production",
            subgroup = "modules",
            energy_required = 40,
            ingredients =
            {
                { "thorium",               30 },
                { "productivity-module-6", 1 },
                { "speed-module-6",        1 }
            },
            results = {
                { "thorium-module-6", 1 }
            }
        },
})

