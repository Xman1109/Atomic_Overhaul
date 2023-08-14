if settings.startup["heat-algo-mode"] == "off" then
    return
end

local function deriveNewHeatRecipe(recipe)
    local newRecipe = table.deepcopy(recipe)
    newRecipe.name = recipe.name .. "-heat"
    newRecipe.category = "heat-furnace"
    for _, tech in pairs(data.raw["technology"]) do
        if tech.effects then
            for _, effect in pairs(tech.effects) do
                if effect.type == "unlock-recipe" and effect.recipe == recipe.name then
                    table.insert(tech.effects,
                        { type = "unlock-recipe", recipe = newRecipe.name })
                end

            end
        end
    end
    return newRecipe
end

-- ``recipeData`` is a Recipe Data; most commonly the ``recipe`` itself or
-- ``recipe.normal`` or ``recipe.expensive``.
--
-- Returns false if ``recipeData`` is nil
local function productMatchesSearchterms(recipeData, searchterms)
    if not recipeData then
        return false
    end

    if recipeData.result then
        for _, i in pairs(searchterms) do
            if recipeData.result:find(i) then
                return true
            end
        end
    elseif recipeData.results then
        for _, result in pairs(recipeData.results) do
            for _, i in pairs(searchterms) do
                if (result[1] and result[1]:find(i)) or
                    (result.name and result.name:find(i)) then
                    return true
                end
            end
        end
    end

    return false
end

local function recipeProductMatchesSearchterms(recipe, searchterms)
    return
        recipe and (
            productMatchesSearchterms(recipe.normal, searchterms) or
            productMatchesSearchterms(recipe.expensive, searchterms) or
            productMatchesSearchterms(recipe, searchterms)
        )
end


local cc = nil
local exports = {}
local setting_searchterms = settings.startup["heat-algo-searchterm"].value
local searchterms = {}
local testrecipes = { "iron-plate", "copper-plate", "stone-brick", "angelsore1-crushed-smelting" }

if ao_debug then
    log("\n\n\n---AO: Auto-Recipe generation started---")
end

for _, recipename in pairs(testrecipes) do
    if data.raw.recipe[recipename] and data.raw.recipe[recipename].category and data.raw.recipe[recipename].category ~= "crafting" then
        cc = data.raw.recipe[recipename].category
        if ao_debug then
            log("Found category " .. cc)
        end
        break
    end
end

for word in string.gmatch(setting_searchterms, '([^, ]+)') do
    table.insert(searchterms, word)
end
if ao_debug then
    log("Keywords: " .. serpent.block(searchterms))
end

if settings.startup["heat-algo-mode"].value == "advanced" then
    if ao_debug then
        log("Advanced Heat Algorithm")
    end
elseif settings.startup["heat-algo-mode"].value == "basic" then
    if ao_debug then
        log("Basic Heat Algorithm Mode")
    end
end


for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.category == cc then
        if recipeProductMatchesSearchterms(recipe, searchterms) then
            if settings.startup["heat-algo-mode"].value == "basic" then
                local newRecipe = deriveNewHeatRecipe(recipe)
                if ao_debug then
                    log("Copied Smelting Recipe: " .. newRecipe.name)
                end
                --data:extend({ newRecipe })
                table.insert(exports, newRecipe)
            elseif settings.startup["heat-algo-mode"].value == "advanced" then
                if recipe.ingredients then
                    for _, resource in pairs(data.raw["resource"]) do
                        if resource.minable and resource.minable.result then
                            for _, ingredient in pairs(recipe.ingredients) do
                                if ingredient[1] == resource.minable.result then
                                    local newRecipe = deriveNewHeatRecipe(recipe)
                                    if ao_debug then
                                        log("Copied Smelting Recipe: " .. newRecipe.name)
                                    end
                                    --data:extend({ newRecipe })
                                    table.insert(exports, newRecipe)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end


if ao_debug then
    log("All Exports: \n" .. serpent.block(exports) .. "\n")
    log("AO: Auto-Recipe generation complete\n\n\n")
end
for _, recipe in pairs(exports) do
    data:extend({ recipe })
end
