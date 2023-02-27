if settings.startup["complexity-level"].value ~= "simple" then
    data:extend(
        {
            {
                type = "recipe",
                name = "thorium-without-research-data",
                icon = graphics .. "thorium-without-research-recipe.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "centrifuging",
                crafting_machine_tint = cmt.thorium,
                energy_required = 50,
                enabled = false,
                order = "e",
                subgroup = "reprocessing-without-research-data",
                ingredients =
                {
                    { "thorium-depleted-cell", 5 }
                },
                results = {
                    { "nuclear-waste", 15 },
                    { type = "item",   name = "thorium", amount_min = 2, amount_max = 3 },
                },
            }
        })
end