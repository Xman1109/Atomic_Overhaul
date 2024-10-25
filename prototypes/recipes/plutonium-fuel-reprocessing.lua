if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "recipe",
                name = "plutonium-fuel-reprocessing",
                icon = graphics .. "plutonium-reprocessing-recipe.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "centrifuging",
                crafting_machine_tint = cmt.plutonium,
                energy_required = 50,
                enabled = false,
                order = "c",
                subgroup = "reprocessing",
                ingredients =
                {
                    {type="item", name="plutonium-depleted-cell", amount=5}
                },
                results = {
                    {type="item", name="nuclear-waste", amount=10},
                    { type = "item",   name = "plutonium",     amount_min = 1, amount_max = 3 },
                    { type = "item",   name = "research-data", amount_min = 4, amount_max = 6 }
                },
            }
        })
end
