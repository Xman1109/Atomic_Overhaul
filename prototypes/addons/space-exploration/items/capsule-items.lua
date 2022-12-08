local list = {
    "uranium-235",
    "uranium-238",
    "uranium-fuel-cell",
    "unmoderated-uranium-fuel-cell",
    "depleted-uranium-fuel-cell",
    "depleted-unmoderated-uranium-fuel-cell",
    "graphite",
    "graphite-fuel-cell",
    "depleted-graphite-fuel-cell",
    "plutonium",
    "plutonium-fuel",
    "plutonium-fuel-cell",
    "depleted-plutonium-fuel-cell",
    "thorium",
    "thorium-fuel-cell",
    "depleted-thorium-fuel-cell",
    "MOX",
    "MOX-fuel-cell",
    "depleted-MOX-fuel-cell"
}

local template = {
    type = "item",
    name = "lead-delivery-cannon-pack-",
    icon = se_addon_graphics .. "lead-delivery-capsule.png",
    icon_size = 64,
    stack_size = 1,
    subgroup = "se-delivery-capsule",
    order = "a[lead-delivery-capsule]",
    allow_decomposition = false,
}

-- now we want to generate new recipes for each item in the list with template as a base

for _, item in pairs(list) do
    if data.raw.item[item] then
        local new_item = table.deepcopy(template)
        new_item.name = new_item.name .. item
        data:extend({ new_item })
    else
        if ao_debug then
            log("Atomic Overhaul: lead-delivery-cannon-pack-recipe.lua: item " .. item .. " not found")
        end
    end
end
