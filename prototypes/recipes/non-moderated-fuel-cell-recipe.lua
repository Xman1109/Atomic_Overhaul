if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "recipe",
                name = "non-moderated-fuel-cell-recipe",
                icon = graphics .. "non-moderated-fuel-cell.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "centrifuging",
                energy_required = 25,
                enabled = false,
                order = "a",
                subgroup = "fuel-cells",
                ingredients =
                {
                    { "empty-fuel-cell", 10 },
                    { "uranium-238",     19 },
                    { "uranium-235",     1 }
                },
                always_show_made_in = true,
                results = {
                    { "non-moderated-fuel-cell", 10 },
                },
            }
        })
end
