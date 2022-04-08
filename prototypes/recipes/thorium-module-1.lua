data:extend({
    {
        type = "recipe",
        name = "thorium-module-1",
        icon = graphics .. "thorium-module-1.png",
        icon_size = 64,
        mipmap_count = 4,
        category = "advanced-crafting",
        enabled = false,
        order = "d",
        subgroup = "module",
        energy_required = 40,
        ingredients =
        {
        {"thorium", 10},
        {"productivity-module", 1},
        {"speed-module", 1}
        },
        results = {
            {"thorium-module-1", 1}
        }
    },
    })