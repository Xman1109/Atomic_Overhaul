if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "recipe",
                name = "plutonium-fuel-cell-recipe",
                icon = graphics .. "plutonium-fuel-cell.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "centrifuging",
                crafting_machine_tint = cmt.plutonium,
                energy_required = 50,
                enabled = false,
                order = "c",
                subgroup = "fuel-cells",
                ingredients =
                {
                    { "empty-fuel-cell",    10 },
                    { "plutonium-fuel-rod", 10 }
                },
                always_show_made_in = true,
                results = {
                    { "plutonium-fuel-cell", 10 }
                },
            }
        })
end
