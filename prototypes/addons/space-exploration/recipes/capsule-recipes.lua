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
    "depleted-MOX-fuel-cell",
    "iridium-192",
    "iridium-fuel-cell",
    "depleted-iridium-fuel-cell",
    "holmium-166",
    "holmium-fuel-cell",
    "depleted-holmium-fuel-cell",
    "beryllium-7",
    "beryllium-fuel-cell",
    "depleted-beryllium-fuel-cell"
}

local template = {
    type = "recipe",
    name = "lead-delivery-cannon-pack-",
    enabled = true,
    energy_required = 10,
    requester_paste_multiplier = 1,
    always_show_made_in = false,
    category = "delivery-cannon",
    hide_from_player_crafting = true,
    hide_from_stats = true,
    allow_decomposition = false,
    ingredients = {
        { "lead-delivery-capsule", 1 },
    },
    group = "atomic-overhaul",
    subgroup = "delivery-capules",
    order = "b",
    result = "lead-delivery-cannon-pack-"
}

-- now we want to generate new recipes for each item in the list with template as a base

for _, item in pairs(list) do
    if data.raw.item[item] then
        if data.raw.item[item] then
            local base_recipe = data.raw.item[item]
            local new_recipe = table.deepcopy(template)
            local amount = math.min(200, base_recipe.stack_size or 1)
            new_recipe.name = new_recipe.name .. item
            new_recipe.result = new_recipe.result .. item
            new_recipe.icon = base_recipe.icon
            new_recipe.icon_size = base_recipe.icon_size
            new_recipe.icon_mipmaps = base_recipe.icon_mipmaps
            new_recipe.localised_name = { "", { "item-name.lead-delivery-capsule" }, ": ", { "item-name." .. item } }
            table.insert(new_recipe.ingredients, { item, amount })
            data:extend({ new_recipe })
            if ao_debug then
                log("Atomic Overhaul: " .. serpent.block(new_recipe))
            end
        else
            if ao_debug then
                log("Atomic Overhaul: lead-delivery-cannon-pack-recipe.lua: recipe " .. item .. " not found")
            end
        end
    else
        if ao_debug then
            log("Atomic Overhaul: lead-delivery-cannon-pack-recipe.lua: item " .. item .. " not found")
        end
    end
end
