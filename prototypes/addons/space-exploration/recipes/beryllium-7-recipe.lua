data:extend(
    {
        {
        type = "recipe",
        name = "beryllium-7-recipe",
        icon = se_addon_graphics .. "beryllium-7.png",
        icon_size = 64, icon_mipmaps = 4,
        category = "space-radiation",
        energy_required = 60,
        enabled = false,
        order = "zc",
        subgroup = "resources",
        ingredients =
        {
            {"se-beryllium-powder", 10},
            {type = "fluid", name = "se-beryllium-hydroxide", amount = 30}
        },
        always_show_made_in = true,
        results = 	{
            {"beryllium-7", 2},
            {type = "item", name = "beryllium-7", probability = 0.11, amount = 3},
            {type = "item", name = "se-beryllium-powder", probability = 0.5, amount = 1},
        },
    }
})