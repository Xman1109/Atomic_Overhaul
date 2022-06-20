data:extend(
    {
        {
        type = "recipe",
        name = "holmium-166-recipe",
        icon = se_addon_graphics .. "holmium-166.png",
        icon_size = 64, mipmap_count = 4,
        category = "space-radiation",
        energy_required = 60,
        enabled = false,
        order = "zb",
        subgroup = "resources",
        ingredients =
        {
            {"se-holmium-powder", 10},
            {type = "fluid", name = "sulfuric-acid", amount = 20}
        },
        always_show_made_in = true,
        results = 	{
            {"holmium-166", 2},
            {type = "item", name = "holmium-166", probability = 0.25, amount = 2},
            {type = "item", name = "se-holmium-powder", probability = 0.5, amount = 1},
        },
    }
})