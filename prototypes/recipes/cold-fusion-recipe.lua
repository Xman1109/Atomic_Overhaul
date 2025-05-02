data:extend(
    {
        {
            type = "recipe",
            name = "cold-fusion-recipe",
            icon = graphics .. "fusion-reactor-icon.png",
            icon_size = 64,
            icon_mipmaps = 4,
            category = "crafting",
            energy_required = 360,
            enabled = false,
            order = "z",
            subgroup = "energy",
            ingredients =
            {
                { type = "item", name = "muonium", amount = 10 },
                { type = "item", name = "iron-plate", amount = 100 },
                { type = "item", name = "steel-plate", amount = 50 },
                { type = "item", name = "refined-concrete", amount = 50},
                { type = "item", name = "processing-unit", amount = 100}
            },
            results = {
                { type = "item", name = "cold-fusion-reactor", amount = 1 }
            },
        }
    })
