if settings.startup["ao-complexity-level"].value ~= "simple" then
    if settings.startup["old-graphite-fuel"].value == true then
        data:extend(
            {
                {
                    type = "recipe",
                    name = "graphite-recipe",
                    icon = graphics .. "graphite.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    category = "advanced-crafting",
                    energy_required = 20,
                    enabled = false,
                    order = "a",
                    subgroup = "resources",
                    ingredients =
                    {
                        { type = "item", name = "coal", amount = 10 }
                    },
                    always_show_made_in = true,
                    results = {
                        { type = "item", name = "graphite", amount = 3 },
                        { type = "item", name = "coal",   amount_min = 1, amount_max = 3 }
                    },
                }
            })
    end
end
