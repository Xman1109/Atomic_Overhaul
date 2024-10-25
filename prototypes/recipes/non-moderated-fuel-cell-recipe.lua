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
                    {type="item", name="empty-fuel-cell", amount=10},
                    {type="item", name="uranium-238", amount=19},
                    {type="item", name="uranium-235", amount=1}
                },
                always_show_made_in = true,
                results = {
                    {type="item", name="non-moderated-fuel-cell", amount=10},
                },
            }
        })
end
