if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "recipe",
                name = "empty-fuel-cell-recipe",
                icon = graphics .. "empty-fuel-cell.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "crafting",
                energy_required = 20,
                enabled = false,
                order = "z",
                subgroup = "fuel-cells",
                ingredients =
                {
                    { "plastic-bar", 10 },
                    { "iron-plate",  10 }
                },
                always_show_made_in = true,
                results = {
                    { "empty-fuel-cell", 10 }
                },
            }
        })
end
