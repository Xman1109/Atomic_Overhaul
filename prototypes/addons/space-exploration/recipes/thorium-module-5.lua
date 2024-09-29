data:extend({
        {
            type = "recipe",
            name = "thorium-module-5",
            icon = se_addon_graphics .. "thorium-module-5.png",
            icon_size = 128,
            icon_mipmaps = 4,
            category = "advanced-crafting",
            enabled = false,
            order = "e",
            group = "production",
            subgroup = "modules",
            energy_required = 40,
            ingredients =
            {
                { "thorium",               30 },
                { "productivity-module-5", 1 },
                { "speed-module-5",        1 }
            },
            results = {
                { "thorium-module-5", 1 }
            }
        },
})

