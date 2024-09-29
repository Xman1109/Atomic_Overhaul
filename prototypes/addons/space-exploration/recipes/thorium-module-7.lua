data:extend({
        {
            type = "recipe",
            name = "thorium-module-7",
            icon = se_addon_graphics .. "thorium-module-7.png",
            icon_size = 128,
            icon_mipmaps = 4,
            category = "advanced-crafting",
            enabled = false,
            order = "g",
            group = "production",
            subgroup = "modules",
            energy_required = 40,
            ingredients =
            {
                { "thorium",               30 },
                { "productivity-module-7", 1 },
                { "speed-module-7",        1 }
            },
            results = {
                { "thorium-module-7", 1 }
            }
        },
})

