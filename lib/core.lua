items = "prototypes.items."
fluids = "prototypes.fluids."
ao_recipes = "prototypes.recipes."
techs = "prototypes.technologies."
entities = "prototypes.entities."
vanilla = "prototypes.vanilla-changes."
base_graphics = "__base__/graphics/icons/"
compatibility = "prototypes.compatibility."
graphics = "__Atomic_Overhaul__/graphics/icons/"
entity_graphics = "__Atomic_Overhaul__/graphics/entities/"
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

local function internalGlow(name, typeOfItem)
    local icon
    local icon_size
    local icon_mipmaps
    local scale
    local resource_glow = {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = graphics .. "resource-light.png",
        scale = 0.25,
        mipmap_count = 4
    }
    local cell_glow = {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = base_graphics .. "uranium-fuel-cell-light.png",
        scale = 0.25,
        mipmap_count = 4
    }
    local fuel_glow = {
        draw_as_light = true,
        flags = { "light" },
        size = 64,
        filename = base_graphics .. "nuclear-fuel-light.png",
        scale = 0.25,
        mipmap_count = 4
    }
    local glow
    if typeOfItem == "resource" then
        glow = resource_glow
    elseif typeOfItem == "cell" then
        glow = cell_glow
    elseif typeOfItem == "fuel" then
        glow = fuel_glow
    else
        log("Error: Unknown typeOfItem: " .. tostring(typeOfItem) .. "\n")
    end

    if data.raw["item"][name] then
        if data.raw["item"][name].icon == nil then
            if data.raw["item"][name].pictures then
                if data.raw["item"][name].pictures.layer == nil then
                    if data.raw["item"][name].icons[1].icon_size then
                        if data.raw["item"][name].icons == nil then
                            log("Error: Item " .. name .. " has no icon." .. "\n")
                        else
                            icon = data.raw["item"][name].icons[1].icon or nil
                            icon_size = data.raw["item"][name].icons[1].icon_size or nil
                            icon_mipmaps = data.raw["item"][name].icons[1].icon_mipmaps or nil
                        end
                    else
                        log("Error: Item " .. name .. " has no icon size." .. "\n")
                    end
                else
                    icon = data.raw["item"][name].pictures.layers[1].filename or nil
                    icon_size = data.raw["item"][name].pictures.layers[1].size or nil
                    icon_mipmaps = data.raw["item"][name].pictures.layers[1].mipmap_count or nil
                end
            else
                log("Error: Item " .. name .. " has no icon or pictures." .. "\n")
            end
        else
            icon = data.raw["item"][name].icon or nil
            icon_size = data.raw["item"][name].icon_size or nil
            icon_mipmaps = data.raw["item"][name].icon_mipmaps or nil
        end
        if icon_size ~= nil then
            if icon_size == 32 then
                scale = 0.5
            elseif icon_size == 64 then
                scale = 0.25
                --TODO: Maybe this needs some tweaking in the future to cover the cases where the icon size is regulated by the picture.layers.size or smth similar
            else
                log(
                    "Error: Item " ..
                    name .. " has not the right icon size (" .. tostring(icon_size) .. "), defaulting to 0.25 !" ..
                    "\n")
                scale = 0.25
            end
        end
        if icon_size == nil then
            log("Error: icon_size is nil" .. "\n")
            glow = nil
        elseif icon == nil then
            log("Error: icon is nil" .. "\n")
            glow = nil
        elseif scale == nil then
            log("Error: scale is nil" .. "\n")
            glow = nil
        elseif icon_mipmaps == nil then
            log("Error: icon_mipmaps is nil" .. "\n")
            glow = nil
        end
        if glow ~= nil then
            data.raw["item"][name].pictures = {
                layers = { {
                    size = icon_size,
                    filename = icon,
                    scale = scale,
                    mipmap_count = icon_mipmaps
                }, glow }
            }
        else
            log("Error: glow is nil" .. "\n")
        end
        if ao_debug == true then
            log("successfully applied " .. typeOfItem .. "-glow on item." .. name .. "\n")
        end
    else
        log("Error: could not find item." .. name .. "\n")
    end
end
---
--- This function is used to make an item glow
---
---@param name (string|table) This is the name of the item
---@param typeOfItem (string) This is the type of item (nil = resource, cell, fuel)
function Glow(name, typeOfItem)
    if typeOfItem == nil then
        typeOfItem = "resource"
    end
    if ao_debug == true then
        log("Trying to apply the Glow function on " .. tostring(typeOfItem) .. "." .. serpent.block(name) .. "\n")
    end
    local scale
    if type(name) == "table" then
        for _, i in ipairs(name) do
            internalGlow(i, typeOfItem)
        end
    else
        internalGlow(name, typeOfItem)
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

---
--- Hides an object of the specified type with the given name(s).
--- @param Type (string) The type of object to hide (e.g. "item", "recipe", "fluid").
--- @param name (string|table) The name(s) of the object to hide. Can be a single string or a table of strings.
function hideType(Type, name)
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

---
-- Modifies the effects of a given technology.
---@param name (string) The name of the technology to modify.
---@param effects (table) The effects to set or add to the technology.
---@param task (string) The task to perform. Can be "replace" to replace the existing effects, "add" to add to the existing effects, or "nil" to default to "replace".
---@return nil
function modifyEffects(name, effects, task)
    if ao_debug == true then
        log(
            "Trying to modify effects of recipe." ..
            name .. " with " .. serpent.block(effects) .. " with Task " .. '"' ..
            tostring(task) .. '"' .. "\n")
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

---
-- Modifies the ingredients of a recipe.
--
---@param name string The name of the recipe to modify.
---@param ingredients table/string The ingredients to add or replace.
---@param task string [optional] The task to perform. Can be "replace", "add", or "globalReplace". Defaults to "replace".
--
function modifyIngredients(name, ingredients, task)
    if ao_debug == true then
        log(
            "Trying to modify ingredients of recipe." ..
            name .. " with " .. serpent.block(ingredients) .. " with Task " ..
            '"' .. tostring(task) .. '"' .. "\n")
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

---
---Modifies the results of a given recipe.
---
---@param name (string) The name of the recipe to modify.
---@param results (table|string) The results to set or add to the recipe.
---@param task (string) The task to perform. Can be "replace" to replace the existing results, "add" to add to the existing results, "globalReplace" to replace the result in all recipes that contain it, or nil to default to "replace".
---@return nil
function modifyResults(name, results, task)
    if ao_debug == true then
        log("Trying to use modifyResults on recipe." .. name .. " with " .. serpent.block(results) .. " and task " ..
            '"' .. tostring(task) .. '"' .. "\n")
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

---
-- Modifies the prerequisites of a given technology.
---@param name (string) The name of the technology to modify.
---@param prerequisites (table|string) The prerequisites to set or add to the technology.
---@param task (string) The task to perform. Can be "replace" to replace the existing prerequisites, "add" to add to the existing prerequisites, or "nil" to default to "replace".
---@return nil
function modifyPrerequisites(name, prerequisites, task)
    if ao_debug == true then
        log("Trying to use modifyPrerequisites on technology." .. name .. " with " .. serpent.block(prerequisites) ..
            " and task " .. '"' .. tostring(task) .. '"' .. "\n")
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

---
-- Changes the group, subgroup, or order of the specified type of object.
--
-- @param type (string) The type of object to modify.
-- @param name (string) The name of the object to modify.
-- @param group (string) The new group to assign to the object.
-- @param subgroup (string) The new subgroup to assign to the object.
-- @param order (string) The new order to assign to the object.
-- @return nil
function regroup(type, name, group, subgroup, order)
    if ao_debug == true then
        log("Trying to use regroup on " .. type .. "." .. name .. " Group: " .. '"' .. tostring(group) .. '"' ..
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

---
---Sets the icon, icon size, icon mipmaps, and pictures of one item to match those of another item.
---@param fromType1 (string) The type of the item to copy the icon and pictures from (e.g., "item", "fluid", "recipe").
---@param fromName1 (string) The name of the item to copy the icon and pictures from.
---@param toType2 (string) The type of the item to apply the copied icon and pictures to.
---@param toName2 (string) The name of the item to apply the copied icon and pictures to.
---@return nil
function iconizer(fromType1, fromName1, toType2, toName2)
    if ao_debug == true then
        log("Trying to use iconizer on " .. fromType1 .. "." .. fromName1 .. " --> " .. toType2 .. "." .. toName2 ..
            "\n")
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
                        fromType1 .. "." .. fromName1 .. "'s icon size got replaced by '" .. toType2 .. "." .. toName2 ..
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
                    log(fromType1 .. "." .. fromName1 .. "'s pictures got replaced by '" .. toType2 .. "." .. toName2 ..
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

---
---Adds the "research-data" ingredient to a technology.
---If the input is a table, the function will iterate over its contents and add the ingredient to each technology found.
---@param name (string|table) The name(s) of the technology/ies to which the ingredient should be added.
---@return nil
function addResearchData(name)
    local found = false
    if ao_debug == true then
        log("Trying to add research data to " .. serpent.block(name) .. "\n")
    end
    if type(name) == "table" then
        for k, i in pairs(name) do
            if data.raw["technology"][i] ~= nil then
                for _, ingredient in pairs(data.raw["technology"][i].unit.ingredients) do
                    if ingredient[1] == "research-data" then
                        found = true
                        break
                    else
                        found = false
                    end
                end
                if found == false then
                    table.insert(data.raw["technology"][i].unit.ingredients, { "research-data", 1 })
                    if ao_debug == true then
                        log("Added research data to " .. i .. "\n")
                    end
                else
                    if ao_debug == true then
                        log("Research data already exists in " .. i .. "\n")
                    end
                end
            else
                log("Error: could not find " .. "technology" .. "." .. i .. "\n")
            end
        end
    else
        if data.raw["technology"][name] ~= nil then
            for _, ingredient in pairs(data.raw["technology"][name].unit.ingredients) do
                if ingredient[1] == "research-data" then
                    found = true
                    break
                else
                    found = false
                end
            end
            if found == false then
                table.insert(data.raw["technology"][name].unit.ingredients, { "research-data", 1 })
                if ao_debug == true then
                    log("Added research data to " .. name .. "\n")
                end
            else
                if ao_debug == true then
                    log("Research data already exists in " .. name .. "\n")
                end
            end
        else
            log("Error: could not find " .. "technology" .. "." .. name .. "\n")
        end
    end
end

---
---Returns a resolved type based on input string
---@param type (string): The input string to be resolved
---@return (string) resolvedType: The resolved type as a string or nil if the input string is unrecognised
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
    tertiary = { 32, 33, 38 }
}
cmt.plutonium = {
    primary = { 101, 160, 103 },
    secondary = { 107, 153, 112 },
    tertiary = { 76, 143, 69 }
}
cmt.MOX = {
    primary = { 111, 131, 69 },
    secondary = { 151, 167, 83 },
    tertiary = { 117, 157, 50 }
}
cmt.thorium = {
    primary = { 199, 206, 118 },
    secondary = { 154, 163, 99 },
    tertiary = { 162, 173, 102 }
}

-- From the base game (not my code)

local heated_pipes_tint = { 0.5, 0.4, 0.3, 0.5 }
local heat_glow_tint = { 1, 1, 1, 1 }

apply_heat_pipe_glow = function(layer)
    layer.tint = heated_pipes_tint
    if layer.hr_version then
        layer.hr_version.tint = heated_pipes_tint
    end
    local light_layer = util.copy(layer)
    light_layer.draw_as_light = true
    light_layer.tint = heat_glow_tint
    if light_layer.hr_version then
        light_layer.hr_version.draw_as_light = true
        light_layer.hr_version.tint = heat_glow_tint
    end
    return {
        layers = { layer, light_layer }
    }
end

function make_4way_animation_from_spritesheet(animation)
    local function make_animation_layer(idx, anim)
        local start_frame = (anim.frame_count or 1) * idx
        local x = 0
        local y = 0
        if anim.line_length then
            y = anim.height * math.floor(start_frame / (anim.line_length or 1))
        else
            x = idx * anim.width
        end
        return {
            filename = anim.filename,
            priority = anim.priority or "high",
            flags = anim.flags,
            x = x,
            y = y,
            width = anim.width,
            height = anim.height,
            frame_count = anim.frame_count or 1,
            line_length = anim.line_length,
            repeat_count = anim.repeat_count,
            shift = anim.shift,
            draw_as_shadow = anim.draw_as_shadow,
            force_hr_shadow = anim.force_hr_shadow,
            apply_runtime_tint = anim.apply_runtime_tint,
            animation_speed = anim.animation_speed,
            scale = anim.scale or 1,
            tint = anim.tint,
            blend_mode = anim.blend_mode
        }
    end

    local function make_animation_layer_with_hr_version(idx, anim)
        local anim_parameters = make_animation_layer(idx, anim)
        if anim.hr_version and anim.hr_version.filename then
            anim_parameters.hr_version = make_animation_layer(idx, anim.hr_version)
        end
        return anim_parameters
    end

    local function make_animation(idx)
        if animation.layers then
            local tab = {
                layers = {}
            }
            for k, v in ipairs(animation.layers) do
                table.insert(tab.layers, make_animation_layer_with_hr_version(idx, v))
            end
            return tab
        else
            return make_animation_layer_with_hr_version(idx, animation)
        end
    end

    return {
        north = make_animation(0),
        east = make_animation(1),
        south = make_animation(2),
        west = make_animation(3)
    }
end

function multiply_recipe(recipe, multiple)
    -- function code by brevven
    -- CC-BY-SA-4.0 license
    -- https://github.com/brevven/foundry
    if recipe then
        if recipe.energy_required then
            recipe.energy_required = recipe.energy_required * multiple
        else
            recipe.energy_required = 0.5 * multiple
        end
        if recipe.result_count then
            recipe.result_count = recipe.result_count * multiple
        end
        if recipe.results then
            for i, result in pairs(recipe.results) do
                if result.name then
                    if result.amount then
                        result.amount = result.amount * multiple
                    end
                    if result.amount_min ~= nil then
                        result.amount_min = result.amount_min * multiple
                        result.amount_max = result.amount_max * multiple
                    end
                    if result.catalyst_amount then
                        result.catalyst_amount = result.catalyst_amount * multiple
                    end
                end
                if result[1] then
                    result[2] = result[2] * multiple
                end
            end
        end
        if not recipe.results and not recipe.result_count then
            -- implicit one item result
            recipe.result_count = multiple
        end
        if recipe.ingredients then
            for i, ingredient in pairs(recipe.ingredients) do
                if ingredient.name then
                    ingredient.amount = ingredient.amount * multiple
                end
                if ingredient[1] then
                    ingredient[2] = ingredient[2] * multiple
                end
            end
        end
    end
end

---
--- This function is used to adjust the fuel value of a given item
---
--- Krastorio2 = 6.3
---
---@param item (string|table) This is the name of the item
---@param multiple (int|float) This is the multiple to apply to the fuel value
function multiplyFuelValue(item, multiple)
    if type(item) == "string" then
        if data.raw["item"][item] then
            if data.raw["item"][item].fuel_value then
                data.raw["item"][item].fuel_value = data.raw["item"][item].fuel_value * multiple
            else
                if ao_debug then
                    log("multiplyFuelValue: " .. item .. " has no fuel_value")
                end
            end
        else
            if ao_debug then
                log("multiplyFuelValue: " .. item .. " does not exist")
            end
        end
    elseif type(item) == "table" then
        for _, v in pairs(item) do
            if data.raw["item"][v] then
                if data.raw["item"][v].fuel_value then
                    data.raw["item"][v].fuel_value = data.raw["item"][v].fuel_value * multiple
                else
                    if ao_debug then
                        log("multiplyFuelValue: " .. v .. " has no fuel_value")
                    end
                end
            else
                if ao_debug then
                    log("multiplyFuelValue: " .. v .. " does not exist")
                end
            end
        end
    else
        if ao_debug then
            log("multiplyFuelValue: " .. item .. " is not a string or table")
        end
    end
end
