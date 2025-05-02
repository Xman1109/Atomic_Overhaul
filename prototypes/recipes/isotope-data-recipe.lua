data:extend(
    {
        {
            type = "recipe",
            name = "research-data-recipe",
            icon = graphics .. "isotope-data.png",
            icon_size = 128,
            icon_mipmaps = 4,
            category = "centrifuging",
            crafting_machine_tint = cmt.beryllium,
            energy_required = 60,
            enabled = false,
            order = "zz",
            subgroup = "resources",
            ingredients =
            {
                { type = "item", name = "isotope-scrap", amount = 1 },
                { type = "item", name = "processing-unit", amount = 100 },
            },
            results = {
                { type = "item", name = "isotope-data", amount_min = 20, amount_max = 100 },
            },
        }
    })
