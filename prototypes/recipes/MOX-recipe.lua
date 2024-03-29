if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "recipe",
                name = "MOX-recipe",
                icon = graphics .. "MOX.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "centrifuging",
                crafting_machine_tint = cmt.MOX,
                energy_required = 20,
                enabled = false,
                order = "d",
                subgroup = "resources",
                ingredients =
                {
                    { "uranium-235", 9 }, -- WHY? WHY mixing enriched instead of depleted?
                    { "plutonium",   1 }
                },
                always_show_made_in = true,
                results = {
                    { "MOX", 8 },
                },
            }
        })
end
