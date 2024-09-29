data:extend({
        {
            type = "recipe",
            name = "thorium-module-4",
            icon = se_addon_graphics .. "thorium-module-4.png",
            icon_size = 128,
            icon_mipmaps = 4,
            category = "advanced-crafting",
            enabled = false,
            order = "d",
            group = "production",
            subgroup = "modules",
            energy_required = 40,
            ingredients =
            {
                { "thorium",               30 },
                { "productivity-module-4", 1 },
                { "speed-module-4",        1 }
            },
            results = {
                { "thorium-module-4", 1 }
            }
        },
})

