if settings.startup["complexity-level"].value == "simple" then
    local m_results
    if mods["SchallUraniumProcessing"] then
        m_results = {
            { "fissile-products", 3 },
            { "plutonium", 1 },
            { "uranium-238", 9 },
            { "uranium-concentrate", 15 }
        }
    else
        m_results = {
            { "fissile-products", 3 },
            { "plutonium", 1 },
            { "uranium-238", 9 },
            { "uranium-ore", 150 }
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
                energy_required = 60,
                enabled = false,
                order = "d",
                subgroup = "reprocessing",
                ingredients =
                {
                    { "MOX-depleted-cell", 6 }
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
                    { "MOX-depleted-cell", 5 }
                },
                results = {
                    { "nuclear-waste", 13 },
                    { type = "item",   name = "MOX",           amount_min = 1, amount_max = 3 },
                    { type = "item",   name = "research-data", amount_min = 7, amount_max = 10 }
                },
            }
        })
end
