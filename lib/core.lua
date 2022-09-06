items = "prototypes.items."
fluids = "prototypes.fluids."
recipes = "prototypes.recipes."
techs = "prototypes.technologies."
entities = "prototypes.entities."
vanilla = "prototypes.vanilla-changes."
base_graphics = "__base__/graphics/icons/"
compatibility = "prototypes.compatibility."
graphics = "__Atomic_Overhaul__/graphics/icons/"
images = "__Atomic_Overhaul__/graphics/images/"

cmt = {} -- crafting machine tint

DEFAULT = {}
DEFAULT.item = {}
DEFAULT.recipe = {}

debug_text = "AO-DEBUG: Compatibilty loaded for: "

local tv = 1

function thorium_module_limitation()
    return { "uranium-processing", "nuclear-fuel-reprocessing", "uranium-without-research-data",
        "plutonium-fuel-reprocessing", "plutonium-without-research-data", "MOX-recipe", "MOX-reprocessing",
        "MOX-without-research-data", "thorium-recipe", "thorium-fuel-reprocessing" }
end

-- the glow function should support tables
function Glow(name, typeOfItem)
    if typeOfItem == nil then
        typeOfItem = "resource"
    end
    if ao_debug == true then
        log("Trying to apply the Glow function on " .. tostring(typeOfItem) .. "." .. serpent.block(name) .. "\n")
    end
    local scale
    if type(name) == "table" then
        for k, i in pairs(name) do
            if data.raw["item"][i].icon_size == 32 then
                scale = 0.5
            elseif data.raw["item"][i].icon_size == 64 then
                scale = 0.25
            else
                log("Error: Item " ..
                    i .. " has not the right icon size (" .. data.raw["item"][i].icon_size .. ")." .. "\n")
            end
            if data.raw["item"][i] then
                if typeOfItem == "resource" then
                    data.raw["item"][i].pictures = {
                        layers = { {
                            size = data.raw["item"][i].icon_size,
                            filename = data.raw["item"][i].icon,
                            scale = scale,
                            mipmap_count = data.raw["item"][i].mipmap_count
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
                        log("successfully applied " .. "resource-glow on item." .. i .. "\n")
                    end
                elseif typeOfItem == "cell" then
                    data.raw["item"][i].pictures = {
                        layers = { {
                            size = data.raw["item"][i].icon_size,
                            filename = data.raw["item"][i].icon,
                            scale = scale,
                            mipmap_count = data.raw["item"][i].mipmap_count
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
                        log("successfully applied " .. typeOfItem .. "-glow on item." .. i .. "\n")
                    end
                elseif typeOfItem == "fuel" then
                    data.raw["item"][i].pictures = {
                        layers = { {
                            size = data.raw["item"][i].icon_size,
                            filename = data.raw["item"][i].icon,
                            scale = scale,
                            mipmap_count = data.raw["item"][i].mipmap_count
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
                        log("successfully applied " .. typeOfItem .. "-glow on item." .. i .. "\n")
                    end
                else
                    log("Error: Unknown typeOfItem: " .. tostring(typeOfItem) .. "\n")
                end
            else
                log("Error: could not find item." .. i .. "\n")
            end
        end
    else
        if data.raw["item"][name].icon_size == 32 then
            scale = 0.5
        elseif data.raw["item"][name].icon_size == 64 then
            scale = 0.25
        else
            log("Error: Item " ..
                name .. " has not the right icon size (" .. data.raw["item"][name].icon_size .. ")." .. "\n")
        end
        if data.raw["item"][name] then
            if typeOfItem == "resource" then
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
                    log("successfully applied " .. "resource-glow on item." .. name .. "\n")
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
                    log("successfully applied " .. typeOfItem .. "-glow on item." .. name .. "\n")
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
                    log("successfully applied " .. typeOfItem .. "-glow on item." .. name .. "\n")
                end
            else
                log("Error: Unknown typeOfItem: " .. tostring(typeOfItem) .. "\n")
            end
        else
            log("Error: could not find item." .. name .. "\n")
        end
    end
end

function getDefaultOf(type, name)
    type = resolveType(type)
    if data.raw[type][name] then
        DEFAULT[type][tv] = table.deepcopy(data.raw[type][name])
        if ao_debug == true then
            log("Saved default of:" .. type .. "." .. name .. " at place: " .. tv .. "\n")
        end
        tv = tv + 1
    else
        if ao_debug == true then
            log("Error: Could not get the default of " .. type .. "." .. name .. "\n")
        end
    end
end

function loadDefaultOf(type, name)
    type = resolveType(type)
    for k, v in pairs(DEFAULT[type]) do
        if DEFAULT[type][k].name == name then
            data.raw[type][name] = DEFAULT[type][k]
            if ao_debug == true then
                log("Loaded default of:" .. type .. "." .. name .. " from place: " .. k .. "\n")
            end
        else
            if ao_debug == true then
                log("Error: Could not find the default of " .. type .. "." .. name .. "\n")
            end
        end
    end
end

function hideType(Type, name) -- supports tables
    if ao_debug == true then
        log("Trying to hide " .. Type .. "." .. serpent.block(name) .. "\n")
    end
    Type = resolveType(Type)

    if type(name) == "table" then
        for _, i in ipairs(name) do
            if data.raw[Type][i] then
                data.raw[Type][i].hidden = true
                if ao_debug == true then
                    log("Successfully hidden " .. Type .. "." .. i .. "\n")
                end
            else
                log("Error: could not find " .. Type .. "." .. i .. "\n")
            end
        end
    else
        if data.raw[Type][name] then
            data.raw[Type][name].hidden = true
            if ao_debug == true then
                log("Successfully hidden " .. Type .. "." .. name .. "\n")
            end
        else
            log("Error: could not find " .. Type .. "." .. name .. "\n")
        end
    end
end

function modifyEffects(name, effects, task)
    if ao_debug == true then
        log("Trying to modify effects of recipe." ..
            name .. " with " .. serpent.block(effects) .. " with Task " .. '"' .. tostring(task) .. '"' .. "\n")
    end
    if data.raw["technology"][name] then
        if task == "replace" or task == nil then
            task = "replace"
            data.raw["technology"][name].effects = effects
            if ao_debug == true then
                log("Replaced effects of technology." .. name .. " with " .. serpent.block(effects) .. "\n")
            end
        elseif task == "add" then
            if type(effects) == "table" then
                for _, i in ipairs(effects) do
                    table.insert(data.raw["technology"][name].effects, i)
                end
                if ao_debug == true then
                    log("Added effects of technology." .. name .. " with " .. serpent.block(effects) .. "\n")
                end
            else
                table.insert(data.raw["technology"][name].effects, effects)
                if ao_debug == true then
                    log("Added effect of technology." .. name .. " with " .. serpent.block(effects) .. "\n")
                end
            end
        else
            log("Unknown task: " .. '"' .. tostring(task) .. '"' .. "\n")
        end
    else
        log("Error: could not find technology." .. name .. "\n")
    end
end

function modifyIngredients(name, ingredients, task)
    if ao_debug == true then
        log("Trying to modify ingredients of recipe." ..
            name .. " with " .. serpent.block(ingredients) .. " with Task " .. '"' .. tostring(task) .. '"' .. "\n")
    end
    if data.raw["recipe"][name] then
        if task == "replace" or task == nil then
            data.raw["recipe"][name].ingredients = ingredients
            if ao_debug == true then
                log("Replaced ingredients of recipe." .. name .. " with " .. serpent.block(ingredients) .. "\n")
            end
        elseif task == "add" then
            if type(ingredients) == "table" then
                for _, i in ipairs(ingredients) do
                    table.insert(data.raw["recipe"][name].ingredients, i)
                end
                if ao_debug == true then
                    log("Added '" .. serpent.block(ingredients) .. "' as ingredients to recipe." .. name .. "\n")
                end
            else
                table.insert(data.raw["recipe"][name].ingredients, ingredients)
                if ao_debug == true then
                    log("Added '" .. serpent.block(ingredients) .. "' as ingredient to recipe." .. name .. "\n")
                end
            end
        elseif task == "globalReplace" then
            for _, recipe in pairs(data.raw.recipe) do
                if recipe.ingredients then
                    for _, ingredient in pairs(recipe.ingredients) do
                        if ingredient.name or ingredient[1] == name then
                            ingredient[1] = ingredients
                            if ao_debug == true then
                                log("Replaced ingredient '" .. name .. "' in recipe '" .. recipe.name .. "' with '" ..
                                    serpent.block(ingredients) .. "'" .. "\n")
                            end
                        end
                    end
                end
            end
        else
            log("Unknown task: " .. '"' .. tostring(task) .. '"' .. "\n")
        end
    else
        log("Error: could not find recipe." .. name .. "\n")
    end
end

function modifyResults(name, results, task)
    if ao_debug == true then
        log("Trying to use modifyResults on recipe." ..
            name .. " with " .. serpent.block(results) .. " and task " .. '"' .. tostring(task) .. '"' .. "\n")
    end
    if data.raw["recipe"][name] then
        if data.raw["recipe"][name].results then
            if task == "replace" or task == nil then
                data.raw["recipe"][name].results = results
                if ao_debug == true then
                    log("Replaced results of recipe." .. name .. " with " .. serpent.block(results) .. "\n")
                end
            elseif task == "add" then
                if type(results) == "table" then
                    for _, i in ipairs(results) do
                        table.insert(data.raw["recipe"][name].results, i)
                    end
                    if ao_debug == true then
                        log("Added '" .. serpent.block(results) .. "' as results to recipe." .. name .. "\n")
                    end
                else
                    table.insert(data.raw["recipe"][name].results, results)
                    if ao_debug == true then
                        log("Added '" .. serpent.block(results) .. "' as result to recipe." .. name .. "\n" .. "\n")
                    end
                end
            elseif task == "globalReplace" then
                for _, recipe in pairs(data.raw["recipe"]) do
                    if recipe.results then
                        for _, result in pairs(recipe.results) do
                            if result.name == name then
                                result.name = results
                                if ao_debug == true then
                                    log("Replaced result '" .. name .. "' in recipe '" .. recipe.name .. "' with '" ..
                                        serpent.block(results) .. "'" .. "\n")
                                end
                            end
                        end
                    end
                end
            else
                log("Unknown task: " .. '"' .. tostring(task) .. '"' .. "\n")
            end
        elseif data.raw["recipe"][name].result then
            if task == "replace" or task == nil then
                data.raw["recipe"][name].result = results
                if ao_debug == true then
                    log("Replaced result of recipe." .. name .. " with " .. serpent.block(results) .. "\n")
                end
            elseif task == "add" then
                if type(results) == "table" then
                    for _, i in ipairs(results) do
                        table.insert(data.raw["recipe"][name].result, i)
                    end
                    if ao_debug == true then
                        log("Added '" .. serpent.block(results) .. "' as result to recipe." .. name .. "\n")
                    end
                else
                    table.insert(data.raw["recipe"][name].result, results)
                    if ao_debug == true then
                        log("Added '" .. serpent.block(results) .. "' as result to recipe." .. name .. "\n")
                    end
                end
            elseif task == "globalReplace" then
                for _, recipe in pairs(data.raw["recipe"]) do
                    if recipe.result then
                        if recipe.result.name == name then
                            recipe.result.name = results
                            if ao_debug == true then
                                log("Replaced result '" .. name .. "' in recipe '" .. recipe.name .. "' with '" ..
                                    serpent.block(results) .. "'" .. "\n")
                            end
                        end
                    end
                end
            else
                log("Unknown task: " .. '"' .. tostring(task) .. '"' .. "\n")
            end
        else
            log("Error: recipe." .. name .. " does not have a result or results field" .. "\n")
        end
    else
        log("Error: could not find recipe." .. name .. "\n")
    end
end

function modifyPrerequisites(name, prerequisites, task)
    if ao_debug == true then
        log("Trying to use modifyPrerequisites on technology." ..
            name .. " with " .. serpent.block(prerequisites) .. " and task " .. '"' .. tostring(task) .. '"' .. "\n")
    end
    if data.raw["technology"][name] then
        if task == "replace" or task == nil then
            data.raw["technology"][name].prerequisites = prerequisites
            if ao_debug == true then
                log("Replaced prerequisites of technology." .. name .. " with " .. serpent.block(prerequisites) .. "\n")
            end
        elseif task == "add" then
            if type(prerequisites) == "table" then
                for _, i in ipairs(prerequisites) do
                    table.insert(data.raw["technology"][name].prerequisites, i)
                end
                if ao_debug == true then
                    log("Added '" .. serpent.block(prerequisites) .. "' as prerequisites to technology." .. name .. "\n")
                end
            else
                table.insert(data.raw["technology"][name].prerequisites, prerequisites)
                if ao_debug == true then
                    log("Added '" .. serpent.block(prerequisites) .. "' as prerequisite to technology." .. name .. "\n")
                end
            end
        else
            log("Unknown task: " .. '"' .. tostring(task) .. '"' .. "\n")
        end
    else
        log("Error: could not find technology." .. name .. "\n")
    end
end

function regroup(type, name, group, subgroup, order)
    if ao_debug == true then
        log("Trying to use regroup on " ..
            type ..
            "." ..
            name ..
            " Group: " ..
            '"' ..
            tostring(group) ..
            '"' ..
            " Subgroup: " .. '"' .. tostring(subgroup) .. '"' .. " order: " .. '"' .. tostring(order) .. '"' .. "\n")
    end
    type = resolveType(type)
    if group == "AO" then
        group = "atomic-overhaul"
    end
    if group and subgroup and order == nil then
        log("Missing Arguments!" .. "\n")
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
                log("Order of " .. type .. "." .. name .. " replaced with '" .. order .. "'" .. "\n")
            end
        end
    else
        log("Error: could not find " .. type .. "." .. name .. "\n")
    end
end

function iconizer(fromType1, fromName1, toType2, toName2) -- fromName1 has the icon you want to move to toName2
    if ao_debug == true then
        log("Trying to use iconizer on " .. fromType1 .. "." .. fromName1 .. " --> " .. toType2 .. "." .. toName2 .. "\n")
    end

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
                    log(fromType1 .. "." .. fromName1 .. " has no pictures" .. "\n")
                end
            end
        else
            log("Error: could not find " .. toType2 .. "." .. toName2 .. "\n")
        end
    else
        log("Error: could not find " .. fromType1 .. "." .. fromName1 .. "\n")
    end
end

function addResearchData(name) -- supports tables
    if ao_debug == true then
        log("Trying to add research data to " .. serpent.block(name) .. "\n")
    end
    if type(name) == "table" then
        for k, i in pairs(name) do
            if data.raw["technology"][i] ~= nil then
                table.insert(data.raw["technology"][i].unit.ingredients, {
                    type = "item",
                    name = "research-data",
                    amount = 1
                })
                if ao_debug == true then
                    log("Added research data to " .. i .. "\n")
                end
            else
                log("Error: could not find " .. "technology" .. "." .. i .. "\n")
            end
        end
    else
        if data.raw["technology"][name] ~= nil then
            table.insert(data.raw["technology"][name].unit.ingredients, {
                type = "item",
                name = "research-data",
                amount = 1
            })
            if ao_debug == true then
                log("Added research data to " .. name)
            end
        else
            log("Error: could not find " .. "technology" .. "." .. name .. "\n")
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
        log("Unrecognised type: " .. type .. "\n")
        resolvedType = nil
    end
    return resolvedType
end

cmt.graphite = {
    primary = { 52, 54, 64 },
    secondary = { 79, 82, 94 },
    tertiary = { 32, 33, 38 },
}
cmt.plutonium = {
    primary = { 101, 160, 103 },
    secondary = { 107, 153, 112 },
    tertiary = { 76, 143, 69 },
}
cmt.MOX = {
    primary = { 111, 131, 69 },
    secondary = { 151, 167, 83 },
    tertiary = { 117, 157, 50 },
}
cmt.thorium = {
    primary = { 199, 206, 118 },
    secondary = { 154, 163, 99 },
    tertiary = { 162, 173, 102 },
}
