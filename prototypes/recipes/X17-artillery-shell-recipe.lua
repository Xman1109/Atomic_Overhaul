data:extend(
    {
        {
            type = "recipe",
            name = "X17-artillery-shell-recipe",
            icon = graphics .. "X17-artillery-shell.png",
            icon_size = 64,
            icon_mipmaps = 4,
            category = "advanced-crafting",
            crafting_machine_tint = cmt.holmium,
            energy_required = 100,
            enabled = false,
            order = "c",
            subgroup = "weaponry",
            ingredients =
            {
                { type = "item", name = "X17-particle", amount = 1 },
                { type = "item", name = "artillery-shell", amount = 10 },
                { type = "item", name = "cluster-grenade",    amount = 10 },
            },
            results = {
                { type = "item", name = "X17-artillery-shell", amount = 10 }
            },
        }
    }
)
