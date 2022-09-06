data:extend({
    {
        type = "recipe",
        name = "thorium-module-3",
        icon = graphics .. "thorium-module-3.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "advanced-crafting",
        enabled = false,
        order = "c",
        subgroup = "modules",
        energy_required = 40,
        ingredients =
        {
        {"thorium", 30},
        {"productivity-module-3", 1},
        {"speed-module-3", 1}
        },
        results = {
            {"thorium-module-3", 1}
        }
    },
    })