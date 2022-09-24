data:extend(
    {
        {
            type = "recipe",
            name = "non-moderated-fuel-reprocessing",
            icon = graphics .. "non-moderated-reprocessing-recipe.png",
            icon_size = 64,
            icon_mipmaps = 4,
            category = "centrifuging",
            energy_required = 50,
            enabled = false,
            order = "a",
            subgroup = "reprocessing",
            ingredients =
            {
                { "non-moderated-depleted-cell", 5 }
            },
            results = {
                { type = "item", name = "uranium-238", amount_min = 1, amount_max = 2 },
                { type = "item", name = "research-data", amount = 3 },
                { type = "item", name = "nuclear-waste", amount = 1 }
            },
        }
    })
