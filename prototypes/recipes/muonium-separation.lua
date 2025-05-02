data:extend(
    {
        {
            type = "recipe",
            name = "muonium-separation",
            icon = graphics .. "muonium-separation.png",
            icon_size = 128,
            icon_mipmaps = 4,
            category = "centrifuging",
            crafting_machine_tint = cmt.beryllium,
            energy_required = 60,
            enabled = false,
            order = "b",
            subgroup = "cold-fusion",
            ingredients =
            {
                { type = "item", name = "muonium", amount = 20 }
            },
            results = {
                { type = "item", name = "true-muonium", amount = 1, probability = 0.05 },
                { type = "item", name = "X17-particle", amount = 1, probability = 0.05 },
                { type = "item", name = "muonium", amount_min = 1, amount_max = 8 },
                { type = "item", name = "stone", amount = 10 },
            },
        }
    })
