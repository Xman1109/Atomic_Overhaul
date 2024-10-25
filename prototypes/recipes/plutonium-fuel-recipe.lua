if settings.startup["ao-complexity-level"].value ~= "simple" then
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
                    {type="item", name="plutonium", amount=1},
                    {type="item", name="rocket-fuel", amount=1}
                },
                always_show_made_in = true,
                results = {
                    {type="item", name="plutonium-fuel", amount=1}
                },
            }
        })
end
