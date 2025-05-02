data:extend(
    {
        {
            type = "recipe",
            name = "X17-magazine-recipe",
            icon = graphics .. "X17-magazine.png",
            icon_size = 64,
            icon_mipmaps = 4,
            category = "advanced-crafting",
            crafting_machine_tint = cmt.holmium,
            energy_required = 100,
            enabled = false,
            order = "a",
            subgroup = "weaponry",
            ingredients =
            {
                { type = "item", name = "X17-particle", amount = 1 },
                { type = "item", name = "uranium-rounds-magazine", amount = 10 },
            },
            always_show_made_in = true,
            results = {
                { type = "item", name = "X17-magazine", amount = 10 },
            },
        }
    })
