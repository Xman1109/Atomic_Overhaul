if settings.startup["ao-complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "recipe",
                name = "plutonium-without-research-data",
                icon = graphics .. "plutonium-without-research-recipe.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "centrifuging",
                crafting_machine_tint = cmt.plutonium,
                energy_required = 50,
                enabled = false,
                order = "c",
                subgroup = "reprocessing-without-research-data",
                ingredients =
                {
                    {type="item", name="plutonium-depleted-cell", amount=5}
                },
                results = {
                    {type="item", name="nuclear-waste", amount=10},
                    { type = "item",   name = "plutonium", amount_min = 2, amount_max = 4 }
                },
            }
        })
end
