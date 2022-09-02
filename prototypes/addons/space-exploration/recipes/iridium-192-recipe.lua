data:extend(
    {
        {
        type = "recipe",
        name = "iridium-192-recipe",
        icon = se_addon_graphics .. "iridium-192.png",
        icon_size = 64, icon_mipmaps = 4,
        category = "space-radiation",
        crafting_machine_tint = cmt.iridium,
        energy_required = 60,
        enabled = false,
        order = "za",
        subgroup = "resources",
        ingredients =
        {
            {"se-iridium-powder", 5},
            {type = "fluid", name = "sulfuric-acid", amount = 10}
        },
        always_show_made_in = true,
        results = 	{
            {"iridium-192", 2},
            {type = "item", name = "iridium-192", probability = 0.25, amount = 1},
            {type = "item", name = "se-iridium-powder", probability = 0.5, amount = 1},
        },
    }
})