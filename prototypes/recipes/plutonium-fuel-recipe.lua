if settings.startup["complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "recipe",
                name = "plutonium-fuel-recipe",
                icon = graphics .. "plutonium-fuel.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "centrifuging",
                crafting_machine_tint = cmt.plutonium,
                energy_required = 20,
                enabled = false,
                order = "b",
                subgroup = "fuel",
                ingredients =
                {
                    { "plutonium",   1 },
                    { "rocket-fuel", 1 }
                },
                always_show_made_in = true,
                results = {
                    { "plutonium-fuel", 1 }
                },
            }
        })
end