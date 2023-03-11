local m_ingredients
local m_results
if settings.startup["ao-complexity-level"].value == "simple" then
    m_ingredients =
    {
        { "plutonium",   4 },
        { "uranium-238", 76 },
        { "iron-plate",  1 }
    }
    m_results = {
        { "MOX-fuel-cell", 2 },
    }
else
    m_ingredients =
    {
        { "MOX",             10 },
        { "empty-fuel-cell", 10 },
        { "graphite",        1 }
    }
    m_results = {
        { "MOX-fuel-cell", 10 },
    }
end

data:extend(
    {
        {
            type = "recipe",
            name = "MOX-fuel-cell-recipe",
            icon = graphics .. "MOX-fuel-cell.png",
            icon_size = 64,
            icon_mipmaps = 4,
            category = "centrifuging",
            crafting_machine_tint = cmt.MOX,
            energy_required = 50,
            enabled = false,
            order = "d",
            subgroup = "fuel-cells",
            ingredients = m_ingredients,
            always_show_made_in = true,
            results = m_results,
        }
    })
