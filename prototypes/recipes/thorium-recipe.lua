if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "recipe",
                name = "thorium-recipe",
                icon = graphics .. "thorium.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "centrifuging",
                crafting_machine_tint = cmt.thorium,
                allowed_effects = {"consumption", "speed", "productivity", "pollution"},
                -- allowed_module_categories = {"thorium-module"}, --TODO: Find out why thorium-modules arent in the category
                energy_required = 20,
                enabled = false,
                order = "f",
                subgroup = "resources",
                ingredients =
                {
                    {type="item", name="uranium-ore", amount=15}
                },
                always_show_made_in = true,
                results = {
                    { type="item",   name="uranium-238",   amount=3 },
                    { type = "item", name = "uranium-235", amount_min = 1, amount_max = 2 },
                    { type = "item", name = "thorium",     amount_min = 0, amount_max = 3 }
                },
            }
        })
end
