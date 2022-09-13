data:extend(
    {
        {
            type = "recipe",
            name = "graphite-furnace-recipe",
            icon = graphics .. "graphite.png",
            icon_size = 64, icon_mipmaps = 4,
            category = "heat-furnace",
            energy_required = 30,
            enabled = false,
            order = "a",
            subgroup = "resources",
            ingredients =
            {
                { "coal", 25 }
            },
            always_show_made_in = true,
            results = {
                { "graphite", 5 },
                { type = "item", name = "coal", amount_min = 1, amount_max = 3 }
            },
        }
    })
