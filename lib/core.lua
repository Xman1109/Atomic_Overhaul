------------------------------------------------------------------------------------------------------------------------------------------
-- TODO: modify the modifyIngredients and modifyResults functions to replace every ingredient/result from the data.raw["recipe"] table.
-- TODO: delete the old unnused functions
-- TODO: make a resolveType function
-- TODO: update the Glow function to support tables
------------------------------------------------------------------------------------------------------------------------------------------

items = "prototypes.items."
fluids = "prototypes.fluids."
recipes = "prototypes.recipes."
techs = "prototypes.technologies."
vanilla = "prototypes.vanilla-changes."
base_graphics = "__base__/graphics/icons/"
compatibility = "prototypes.compatibility."
graphics = "__Atomic_Overhaul__/graphics/icons/"
images = "__Atomic_Overhaul__/graphics/images/"

DEFAULT = {}
DEFAULT.item = {}
DEFAULT.recipe = {}

debug_text = "AO-DEBUG: Compatibilty loaded for: "

local tv = 1

data:extend({ {
    type = "module-category",
    name = "thorium-module"

} })

function thorium_module_limitation()
    return { "uranium-processing", "nuclear-fuel-reprocessing", "uranium-without-research-data",
        "plutonium-fuel-reprocessing", "plutonium-without-research-data", "MOX-recipe", "MOX-reprocessing",
        "MOX-without-research-data", "thorium-recipe", "thorium-fuel-reprocessing" }
end

function resourceGlow(item)
    local scale
    if data.raw["item"][item].icon_size == 32 then
        scale = 0.5
    elseif data.raw["item"][item].icon_size == 64 then
        scale = 0.25
    else
        log("Error: Item " .. item .. " has not the right icon size (" .. data.raw["item"][item].icon_size .. ").")
    end
    data.raw["item"][item].pictures = {
        layers = { {
            size = data.raw["item"][item].icon_size,
            filename = data.raw["item"][item].icon,
            scale = scale,
            mipmap_count = data.raw["item"][item].mipmap_count
        }, {
            draw_as_light = true,
            flags = { "light" },
            size = 64,
            filename = graphics .. "resource-light.png",
            scale = 0.25,
            mipmap_count = 4
        } }
    }
end

function Glow(name, typeOfItem)
    local scale
    if data.raw["item"][name].icon_size == 32 then
        scale = 0.5
    elseif data.raw["item"][name].icon_size == 64 then
        scale = 0.25
    else
        log("Error: Item " .. name .. " has not the right icon size (" .. data.raw["item"][name].icon_size .. ").")
    end
    if data.raw["item"][name] then
        if typeofItem == nil or "resource" then
            typeOfItem = "resource"
            data.raw["item"][name].pictures = {
                layers = { {
                    size = data.raw["item"][name].icon_size,
                    filename = data.raw["item"][name].icon,
                    scale = scale,
                    mipmap_count = data.raw["item"][name].mipmap_count
                }, {
                    draw_as_light = true,
                    flags = { "light" },
                    size = 64,
                    filename = graphics .. "resource-light.png",
                    scale = 0.25,
                    mipmap_count = 4
                } }
            }
            if ao_debug == true then
                log("successfully applied " .. typeOfItem .. "-glow on item." .. name)
            end
        elseif typeOfItem == "cell" then
            data.raw["item"][name].pictures = {
                layers = { {
                    size = data.raw["item"][name].icon_size,
                    filename = data.raw["item"][name].icon,
                    scale = scale,
                    mipmap_count = data.raw["item"][name].mipmap_count
                }, {
                    draw_as_light = true,
                    flags = { "light" },
                    size = 64,
                    filename = base_graphics .. "uranium-fuel-cell-light.png",
                    scale = 0.25,
                    mipmap_count = 4
                } }
            }
            if ao_debug == true then
                log("successfully applied " .. typeOfItem .. "-glow on item." .. name)
            end
        elseif typeOfItem == "fuel" then
            data.raw["item"][name].pictures = {
                layers = { {
                    size = data.raw["item"][name].icon_size,
                    filename = data.raw["item"][name].icon,
                    scale = scale,
                    mipmap_count = data.raw["item"][name].mipmap_count
                }, {
                    draw_as_light = true,
                    flags = { "light" },
                    size = 64,
                    filename = base_graphics .. "nuclear-fuel-light.png",
                    scale = 0.25,
                    mipmap_count = 4
                } }
            }
            if ao_debug == true then
                log("successfully applied " .. typeOfItem .. "-glow on item." .. name)
            end
        else
            log("Error: Uknown typeOfItem: " .. typeOfItem)
        end
        log("Error: could not find item." .. name)
    end
end

function getDefaultOf(type, name)
    type = resolveType(type)
    if data.raw[type][name] then
        DEFAULT[type][tv] = table.deepcopy(data.raw[type][name])
        if ao_debug == true then
            log("Saved default of:" .. type .. "." .. name .. " at place: " .. tv)
        end
        tv = tv + 1
    else
        if ao_debug == true then
            log("Error: Could not get the default of " .. type .. "." .. name)
        end
    end
end

function loadDefaultOf(type, name)
    type = resolveType(type)
    for k, v in pairs(DEFAULT[type]) do
        if DEFAULT[type][k].name == name then
            data.raw[type][name] = DEFAULT[type][k]
            if ao_debug == true then
                log("Loaded default of:" .. type .. "." .. name .. " from place: " .. k)
            end
        else
            if ao_debug == true then
                log("Error: Could not find the default of " .. type .. "." .. name)
            end
        end
    end
end

function hideType(fromType1, name) -- supports tables
    fromType1 = resolveType(fromType1)

    if type(name) == "table" then
        for _, i in ipairs(name) do
            if data.raw[fromType1][i] then
                data.raw[fromType1][i].hidden = true
            else
                log("Error: could not find " .. fromType1 .. "." .. i)
            end
        end
    else
        if data.raw[fromType1][name] then
            data.raw[fromType1][name].hidden = true
        else
            log("Error: could not find " .. fromType1 .. "." .. name)
        end
    end
end

function replaceEffects(t, effects)
    if data.raw["technology"][t] then
        data.raw["technology"][t].effects = effects
        if ao_debug == true then
            log("Replaced effects of technology." .. t .. " with " .. serpent.block(effects))
        end
    else
        log("Error: could not find technology." .. t)
    end
end

function modifyEffects(name, effects, task)
    if data.raw["technology"][name] then
        if task == "replace" or nil then
            data.raw["technology"][name].effects = effects
            if ao_debug == true then
                log("Replaced effects of technology." .. name .. " with " .. serpent.block(effects))
            end
        elseif task == "add" then
            if type(effects) == "table" then
                for _, i in ipairs(effects) do
                    table.insert(data.raw["technology"][name].effects, i)
                end
                if ao_debug == true then
                    log("Added effects of technology." .. name .. " with " .. serpent.block(effects))
                end
            else
                table.insert(data.raw["technology"][name].effects, effects)
                if ao_debug == true then
                    log("Added effect of technology." .. name .. " with " .. serpent.block(effects))
                end
            end
        else
            log("Unknown task: " .. task)
        end
    else
        log("Error: could not find technology." .. name)
    end
end

function replaceIngredients(r, ingredients)
    if data.raw["recipe"][r] then
        data.raw["recipe"][r].ingredients = ingredients
        if ao_debug == true then
            log("Replaced ingredients of recipe." .. r .. " with " .. serpent.block(ingredients))
        end
    else
        log("Error: could not find recipe." .. r)
    end
end

function modifyIngredients(name, ingredients, task)
    if data.raw["recipe"][name] then
        if task == "replace" or nil then
            data.raw["recipe"][name].ingredients = ingredients
            if ao_debug == true then
                log("Replaced ingredients of recipe." .. name .. " with " .. serpent.block(ingredients))
            end
        elseif task == "add" then
            if type(ingredients) == "table" then
                for _, i in ipairs(ingredients) do
                    table.insert(data.raw["recipe"][name].ingredients, i)
                end
                if ao_debug == true then
                    log("Added '" .. serpent.block(ingredients) .. "' as ingredients to recipe." .. name)
                end
            else
                table.insert(data.raw["recipe"][name].ingredients, ingredients)
                if ao_debug == true then
                    log("Added '" .. serpent.block(ingredients) .. "' as ingredient to recipe." .. name)
                end
            end
        else
            log("Unknown task: " .. task)
        end
    else
        log("Error: could not find recipe." .. name)
    end
end

function modifyResults(name, results, task)
    if data.raw["recipe"][name] then
        if data.raw["recipe"][name].results then
            if task == "replace" or nil then
                data.raw["recipe"][name].results = results
                if ao_debug == true then
                    log("Replaced results of recipe." .. name .. " with " .. serpent.block(results))
                end
            elseif task == "add" then
                if type(results) == "table" then
                    for _, i in ipairs(results) do
                        table.insert(data.raw["recipe"][name].results, i)
                    end
                    if ao_debug == true then
                        log("Added '" .. serpent.block(results) .. "' as results to recipe." .. name)
                    end
                else
                    table.insert(data.raw["recipe"][name].results, results)
                    if ao_debug == true then
                        log("Added '" .. serpent.block(results) .. "' as result to recipe." .. name)
                    end
                end
            else
                log("Unknown task: " .. task)
            end
        elseif data.raw["recipe"][name].result then
            if task == "replace" or nil then
                data.raw["recipe"][name].result = results
                if ao_debug == true then
                    log("Replaced result of recipe." .. name .. " with " .. serpent.block(results))
                end
            elseif task == "add" then
                if type(results) == "table" then
                    for _, i in ipairs(results) do
                        table.insert(data.raw["recipe"][name].result, i)
                    end
                    if ao_debug == true then
                        log("Added '" .. serpent.block(results) .. "' as result to recipe." .. name)
                    end
                else
                    table.insert(data.raw["recipe"][name].result, results)
                    if ao_debug == true then
                        log("Added '" .. serpent.block(results) .. "' as result to recipe." .. name)
                    end
                end
            else
                log("Unknown task: " .. task)
            end
        else
            log("Error: recipe." .. name .. " does not have a result or results field")
        end
    else
        log("Error: could not find recipe." .. name)
    end
end

function replacePrerequisites(t, prerequisites)
    if data.raw["technology"][t] then
        data.raw["technology"][t].prerequisites = prerequisites
        if ao_debug == true then
            log("Replaced prerequisites of technology." .. t .. " with " .. serpent.block(prerequisites))
        end
    else
        log("Error: could not find technology." .. t)
    end
end

function modifyPrerequisites(name, prerequisites, task)
    if data.raw["technology"][name] then
        if task == "replace" or nil then
            data.raw["technology"][name].prerequisites = prerequisites
            if ao_debug == true then
                log("Replaced prerequisites of technology." .. name .. " with " .. serpent.block(prerequisites))
            end
        elseif task == "add" then
            if type(prerequisites) == "table" then
                for _, i in ipairs(prerequisites) do
                    table.insert(data.raw["technology"][name].prerequisites, i)
                end
                if ao_debug == true then
                    log("Added '" .. serpent.block(prerequisites) .. "' as prerequisites to technology." .. name)
                end
            else
                table.insert(data.raw["technology"][name].prerequisites, prerequisites)
                if ao_debug == true then
                    log("Added '" .. serpent.block(prerequisites) .. "' as prerequisite to technology." .. name)
                end
            end
        else
            log("Unknown task: " .. task)
        end
    else
        log("Error: could not find technology." .. name)
    end
end

function regroup(type, name, group, subgroup, order)
    type = resolveType(type)
    if group == "AO" then
        group = "atomic-overhaul"
    end
    if group and subgroup and order == nil then
        log("Missing Arguments!")
        return
    end
    if data.raw[type][name] then
        if group ~= nil then
            data.raw[type][name].group = group
            if ao_debug == true then
                log("Group of " .. type .. "." .. name .. " replaced with '" .. group .. "'")
            end
        end
        if subgroup ~= nil then
            data.raw[type][name].subgroup = subgroup
            if ao_debug == true then
                log("Subgroup of " .. type .. "." .. name .. " got replaced with '" .. subgroup .. "'")
            end
        end
        if order ~= nil then
            data.raw[type][name].order = order
            if ao_debug == true then
                log("Order of " .. type .. "." .. name .. " replaced with '" .. order .. "'")
            end
        end
    else
        log("Error: could not find " .. type .. "." .. name)
    end
end

function iconizer(fromType1, fromName1, toType2, toName2) -- fromName1 has the icon you want to move to toName2

    fromType1 = resolveType(fromType1)
    toType2 = resolveType(toType2)

    if data.raw[fromType1][fromName1] ~= nil then
        if data.raw[fromType1][toName2] ~= nil then
            if data.raw[fromType1][fromName1].icon ~= nil then
                data.raw[toType2][toName2].icon = data.raw[fromType1][fromName1].icon
                if ao_debug == true then
                    log(fromType1 .. "." .. fromName1 .. "'s icon got replaced by '" .. toType2 .. "." .. toName2 .. "'")
                end
            else
                if ao_debug == true then
                    log(fromType1 .. "." .. fromName1 .. " has no icon")
                end
            end
            if data.raw[fromType1][fromName1].icon_size ~= nil then
                data.raw[toType2][toName2].icon_size = data.raw[fromType1][fromName1].icon_size
                if ao_debug == true then
                    log(
                        fromType1 ..
                        "." .. fromName1 .. "'s icon size got replaced by '" .. toType2 .. "." .. toName2 ..
                        "'")
                end
            else
                if ao_debug == true then
                    log(fromType1 .. "." .. fromName1 .. " has no icon size")
                end
            end
            if data.raw[fromType1][fromName1].icon_mipmaps ~= nil then
                data.raw[toType2][toName2].icon_mipmaps = data.raw[fromType1][fromName1].icon_mipmaps
                if ao_debug == true then
                    log(fromType1 .. "." .. fromName1 .. "'s icon mipmaps got replaced by '" .. toType2 .. "." ..
                        toName2 .. "'")
                end
            else
                if ao_debug == true then
                    log(fromType1 .. "." .. fromName1 .. " has no mipmaps")
                end
            end
            if data.raw[fromType1][fromName1].pictures ~= nil then
                data.raw[toType2][toName2].pictures = data.raw[fromType1][fromName1].pictures
                if ao_debug == true then
                    log(fromType1 ..
                        "." .. fromName1 .. "'s pictures got replaced by '" .. toType2 .. "." .. toName2 ..
                        "'")
                end
            else
                if ao_debug == true then
                    log(fromType1 .. "." .. fromName1 .. " has no pictures")
                end
            end
        else
            log("Error: could not find " .. toType2 .. "." .. toName2)
        end
    else
        log("Error: could not find " .. fromType1 .. "." .. fromName1)
    end
end

function addResearchData(name) -- supports tables
    if type(name) == "table" then
        for i in name do
            if data.raw["technology"][i] ~= nil then
                table.insert(data.raw["technology"][i].unit.ingredients, "research-data")
                if ao_debug == true then
                    log("Added research data to " .. i)
                end
            else
                log("Error: could not find " .. "technology" .. "." .. i)
            end
        end
    else
        if data.raw["technology"][name] ~= nil then
            table.insert(data.raw["technology"][name].unit.ingredients, "research-data")
            if ao_debug == true then
                log("Added research data to " .. name)
            end
        else
            log("Error: could not find " .. "technology" .. "." .. name)
        end
    end
end

function resolveType(type)
    local resolvedType
    if type == "i" then
        resolvedType = "item"
    elseif type == "r" then
        resolvedType = "recipe"
    elseif type == "t" then
        resolvedType = "technology"
    elseif type == "to" then
        resolvedType = "tool"
    elseif type == "is" then
        resolvedType = "item-subgroup"
    else
        log("Unrecognised type: " .. type)
        resolvedType = nil
    end
    return resolvedType
end