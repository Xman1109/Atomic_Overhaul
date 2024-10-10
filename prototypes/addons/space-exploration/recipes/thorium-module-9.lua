data:extend({
        {
            type = "recipe",
            name = "thorium-module-9",
            icon = se_addon_graphics .. "thorium-module-9.png",
            icon_size = 128,
            icon_mipmaps = 4,
            category = "advanced-crafting",
            enabled = false,
            order = "i",
            group = "production",
            subgroup = "modules",
            energy_required = 40,
            ingredients =
            {
                { "thorium",               30 },
                { "productivity-module-9", 1 },
                { "speed-module-9",        1 }
            },
            results = {
                { "thorium-module-9", 1 }
            }
        },
})
