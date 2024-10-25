if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "recipe",
                name = "graphite-furnace-recipe",
                icon = graphics .. "graphite.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "heat-furnace",
                energy_required = 30,
                enabled = false,
                order = "a",
                subgroup = "resources",
                ingredients =
                {
                    {type="item", name="coal", amount=25}
                },
                always_show_made_in = true,
                results = {
                    {type="item", name="graphite", amount=5},
                    { type = "item", name = "coal", amount_min = 1, amount_max = 3 }
                },
            }
        })
end
