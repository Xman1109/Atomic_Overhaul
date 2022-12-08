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
    type = "recipe",
    name = "lead-delivery-cannon-pack-",
    enabled = false,
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
    result = "lead-delivery-cannon-pack-"
}

-- now we want to generate new recipes for each item in the list with template as a base

for _, item in pairs(list) do
    if data.raw.item[item] then
        if data.raw.recipe[item] then
            local base_recipe = data.raw.recipe[item]
            local new_recipe = table.deepcopy(template)
            local amount = math.min(200, base_recipe.stack_size or 1)
            new_recipe.name = new_recipe.name .. item
            new_recipe.result = new_recipe.result .. item
            new_recipe.icon = base_recipe.icon
            new_recipe.icon_size = base_recipe.icon_size
            new_recipe.icon_mipmaps = base_recipe.icon_mipmaps
            table.insert(new_recipe.ingredients, { item, amount })
            data:extend({ new_recipe })
            table.insert(data.raw.technology["se-delivery-cannon"].effects,
                { type = "unlock-recipe", recipe = new_recipe.name })
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
