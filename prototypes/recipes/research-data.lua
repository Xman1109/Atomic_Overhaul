if settings.startup["ao-complexity-level"].value == "full" then
    data:extend(
        {
            {
                type = "recipe",
                name = "research-data-recipe",
                icon = graphics .. "research-data.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "centrifuging",
                crafting_machine_tint = cmt.thorium,
                energy_required = 30,
                enabled = false,
                order = "z",
                subgroup = "resources",
                localized_name = "research-data",
                always_show_made_in = true,
                ingredients =
                {
                    {type="item", name="uranium-235", amount=1},
                    {type="item", name="copper-plate", amount=2},
                    {type="item", name="plastic-bar", amount=5}
                },
                results = {
                    { type = "item", name = "research-data", amount_min = 3, amount_max = 5 },
                },
            }
        })
end
