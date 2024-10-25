if settings.startup["ao-complexity-level"].value == "simple" then
    local m_results
    if mods["SchallUraniumProcessing"] then
        m_results = {
            { name = "fissile-products", amount_min = 2, amount_max = 3 },
            {type="item", name="plutonium", amount=1},
            {type="item", name="uranium-238", amount=10},
            {type="item", name="uranium-concentrate", amount=34}
        }
    else
        m_results = {
            { name = "fissile-products", amount_min = 2, amount_max = 3 },
            {type="item", name="plutonium", amount=1},
            {type="item", name="uranium-238", amount=10},
            {type="item", name="uranium-ore", amount=340}
        }
    end
    data:extend(
        {
            {
                type = "recipe",
                name = "MOX-reprocessing",
                icon = graphics .. "MOX-reprocessing-recipe.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "centrifuging",
                crafting_machine_tint = cmt.MOX,
                energy_required = 80,
                allow_decomposition = false,
                enabled = false,
                order = "d",
                subgroup = "reprocessing",
                ingredients =
                {
                    {type="item", name="MOX-depleted-cell", amount=3}
                },
                results = m_results,
            }
        })
else
    data:extend(
        {
            {
                type = "recipe",
                name = "MOX-reprocessing",
                icon = graphics .. "MOX-reprocessing-recipe.png",
                icon_size = 64,
                icon_mipmaps = 4,
                category = "centrifuging",
                crafting_machine_tint = cmt.MOX,
                energy_required = 50,
                enabled = false,
                order = "d",
                subgroup = "reprocessing",
                ingredients =
                {
                    {type="item", name="MOX-depleted-cell", amount=5}
                },
                results = {
                    {type="item", name="nuclear-waste", amount=13},
                    { type = "item",   name = "MOX",           amount_min = 1, amount_max = 3 },
                    { type = "item",   name = "research-data", amount_min = 7, amount_max = 10 }
                },
            }
        })
end
