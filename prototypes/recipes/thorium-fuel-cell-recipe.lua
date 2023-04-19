if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "recipe",
                name = "thorium-fuel-cell-recipe",
                icon = graphics .. "thorium-fuel-cell.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "centrifuging",
                crafting_machine_tint = cmt.thorium,
                energy_required = 50,
                enabled = false,
                order = "f",
                subgroup = "fuel-cells",
                ingredients =
                {
                    { "thorium-fuel-rod", 10 },
                    { "empty-fuel-cell",  10 }
                },
                always_show_made_in = true,
                results = {
                    { "thorium-fuel-cell", 10 },
                },
            }
        })
end
