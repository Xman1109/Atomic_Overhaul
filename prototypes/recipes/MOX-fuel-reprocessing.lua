if settings.startup["complexity-level"].value == "simple" then
    local m_results
    if mods["SchallUraniumProcessing"] then
        m_results = {
            { "fissile-products", 4 },
            { "plutonium", 2 },
            { "uranium-238", 18 },
            { "uranium-concentrate", 21 }
        }
    else
        m_results = {
            { "fissile-products", 4 },
            { "plutonium", 2 },
            { "uranium-238", 21 },
            { "uranium-ore", 180 }
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
                energy_required = 72,
                enabled = false,
                order = "d",
                subgroup = "reprocessing",
                ingredients =
                {
                    { "MOX-depleted-cell", 2 }
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
