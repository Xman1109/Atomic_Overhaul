data:extend(
    {
        {
            type = "recipe",
            name = "non-moderated-fuel-reprocessing",
            icon = graphics .. "graphite-reprocessing-recipe.png",
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
                { type = "item", name = "empty-fuel-cell", amount_min = 0, amount_max = 1 },
                { type = "item", name = "uranium-238", amount_min = 0, amount_max = 1 }
            },
        }
    })
