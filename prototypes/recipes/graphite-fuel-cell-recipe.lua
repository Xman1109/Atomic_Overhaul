if settings.startup["ao-complexity-level"].value ~= "simple" then
    if settings.startup["old-graphite-fuel"].value == true then
        data:extend(
            {
                {
                    type = "recipe",
                    name = "graphite-fuel-cell-recipe",
                    icon = graphics .. "graphite-fuel-cell.png",
                    icon_size = 64,
                    icon_mipmaps = 4,
                    category = "centrifuging",
                    crafting_machine_tint = cmt.graphite,
                    energy_required = 50,
                    enabled = false,
                    order = "a",
                    subgroup = "fuel-cells",
                    ingredients =
                    {
                        { type = "item", name = "empty-fuel-cell", amount = 10 },
                        { type = "item", name = "graphite",    amount = 10 }
                    },
                    always_show_made_in = true,
                    results = {
                        { type = "item", name = "graphite-fuel-cell", amount = 10 },
                    },
                }
            })
    end
end
