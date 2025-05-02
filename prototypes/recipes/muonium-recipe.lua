data:extend(
    {
        {
            type = "recipe",
            name = "muonium-recipe",
            icon = graphics .. "muonium-container.png",
            icon_size = 64,
            icon_mipmaps = 4,
            category = "centrifuging",
            crafting_machine_tint = cmt.beryllium,
            energy_required = 30,
            enabled = false,
            order = "c",
            subgroup = "cold-fusion",
            ingredients =
            {
                { type = "item", name = "isotope-scrap", amount = 3 }
            },
            results = {
                { type = "item", name = "muonium", amount_min = 3, amount_max = 5 },
            },
        }
    })
