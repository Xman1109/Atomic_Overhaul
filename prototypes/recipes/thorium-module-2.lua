data:extend({
    {
        type = "recipe",
        name = "thorium-module-2",
        icon = graphics .. "thorium-module-2.png",
        icon_size = 64,
        icon_mipmaps = 4,
        category = "advanced-crafting",
        enabled = false,
        order = "b",
        subgroup = "modules",
        energy_required = 40,
        ingredients =
        {
        {"thorium", 20},
        {"productivity-module-2", 1},
        {"speed-module-2", 1}
        },
        results = {
            {"thorium-module-2", 1}
        }
    },
    })