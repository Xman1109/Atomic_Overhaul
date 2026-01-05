local m_ingredients
local m_results
local m_time
local m_category
if settings.startup["ao-complexity-level"].value == "simple" then
    m_category = "crafting"
    m_ingredients =
    {
        {type="item", name="plutonium", amount=4},
        {type="item", name="uranium-238", amount=95},
        {type="item", name="iron-plate", amount=5}
    }
    m_results = {
        {type="item", name="MOX-fuel-cell", amount=5},
    }
    m_time = 75
else
    m_category = "centrifuging"
    m_ingredients =
    {
        {type="item", name="MOX-fuel-rod", amount=10},
        {type="item", name="empty-fuel-cell", amount=10}
    }
    m_results = {
        {type="item", name="MOX-fuel-cell", amount=10},
    }
    m_time = 50
end

data:extend(
    {
        {
            type = "recipe",
            name = "MOX-fuel-cell",
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
