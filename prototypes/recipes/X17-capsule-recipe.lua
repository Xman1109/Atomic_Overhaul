data:extend(
    {
        {
            type = "recipe",
            name = "X17-capsule-recipe",
            icon = graphics .. "X17-capsule.png",
            icon_size = 64,
            icon_mipmaps = 4,
            category = "advanced-crafting",
            crafting_machine_tint = cmt.holmium,
            energy_required = 100,
            enabled = false,
            order = "b",
            subgroup = "weaponry",
            ingredients =
            {
                { type = "item", name = "X17-particle", amount = 1 },
                { type = "item", name = "barrel",       amount = 10 },
                { type = "item", name = "explosives",    amount = 10 },
            },
            always_show_made_in = true,
            results = {
                { type = "item", name = "X17-capsule", amount = 10 }
            },
        }
    }
)
