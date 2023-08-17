local m_ingredients
local m_results
local m_time
local m_category
if settings.startup["ao-complexity-level"].value == "simple" then
    m_category = "crafting"
    m_ingredients =
    {
        { "plutonium",   4 },
        { "uranium-238", 85 },
        { "iron-plate",  3 }
    }
    m_results = {
        { "MOX-fuel-cell", 3 },
    }
    m_time = 75
else
    m_category = "centrifuging"
    m_ingredients =
    {
        { "MOX-fuel-rod",    10 },
        { "empty-fuel-cell", 10 }
    }
    m_results = {
        { "MOX-fuel-cell", 10 },
    }
    m_time = 50
end

data:extend(
    {
        {
            type = "recipe",
            name = "MOX-fuel-cell-recipe",
            icon = graphics .. "MOX-fuel-cell.png",
            icon_size = 64,
            icon_mipmaps = 4,
            category = m_category,
            crafting_machine_tint = cmt.MOX,
            energy_required = m_time,
            enabled = false,
            order = "d",
            subgroup = "fuel-cells",
            ingredients = m_ingredients,
            always_show_made_in = true,
            results = m_results,
        }
    })
