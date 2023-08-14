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

-- ``recipeData`` is a Recipe Data; most commonly the ``recipe`` itself or
-- ``recipe.normal`` or ``recipe.expensive``.
--
-- Returns false if ``recipeData`` is nil
local function recipeDataHasMinableIngredient(recipeData)
    if not recipeData or not recipeData.ingredients then
        return false
    end

    for _, ingredient in pairs(recipeData.ingredients) do
        for _, resource in pairs(data.raw["resource"]) do
            if resource.minable then
                if resource.minable.result then
                    if ingredient[1] == resource.minable.result or
                        ingredient.name == resource.minable.result then
                        return true
                    end
                elseif resource.minable.results then
                    for _, result in pairs(resource.minable.results) do
                        -- Note: We cannot compare with 2-by-2 like this:
                        --
                        -- > if (ingredient[1] == result[1]) or
                        -- >     (ingredient[1] == result.name) or
                        -- >     (ingredient.name == result[1]) or
                        -- >     (ingredient.name == result.name) then
                        -- >     return true
                        -- > end
                        --
                        -- because one of the two entries abc[1] and abc.name
                        -- will be nil, thus one of the four comparisons will
                        -- result in ``nil == nil``, which is true.
                        result_name = result[1] or result.name
                        ingredient_name = ingredient[1] or ingredient.name
                        if (ingredient_name == result_name) then
                            return true
                        end
                    end
                end
            end
        end
    end

    return false
end

-- Returns true if the recipe contains at least one minable ingredient
-- otherwise false.
--
-- Returns false if ``recipe`` is nil.
local function recipeHasMinableIngredient(recipe)
    return
        recipe and (
            recipeDataHasMinableIngredient(recipe.normal) or
            recipeDataHasMinableIngredient(recipe.expensive) or
            recipeDataHasMinableIngredient(recipe)
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

if setting_searchterms == "" then
    -- empty word matches everything
    table.insert(searchterms, "")
    if ao_debug then
        log("Keywords: No keywords")
    end
else
    for word in string.gmatch(setting_searchterms, '([^, ]+)') do
        table.insert(searchterms, word)
    end
    if ao_debug then
        log("Keywords: " .. serpent.block(searchterms))
    end
end

if ao_debug then
    if settings.startup["heat-algo-mode"].value == "advanced" then
        log("Advanced Heat Algorithm")
    elseif settings.startup["heat-algo-mode"].value == "basic" then
        log("Basic Heat Algorithm Mode")
    end
end


for _, recipe in pairs(data.raw["recipe"]) do
    if recipe.category == cc and
            recipeProductMatchesSearchterms(recipe, searchterms) and (
                (settings.startup["heat-algo-mode"].value == "basic") or
                (settings.startup["heat-algo-mode"].value == "advanced" and recipeHasMinableIngredient(recipe))
            ) then
        local newRecipe = deriveNewHeatRecipe(recipe)
        if ao_debug then
            log("Copied Smelting Recipe: " .. newRecipe.name)
        end
        --data:extend({ newRecipe })
        table.insert(exports, newRecipe)
    end
end


if ao_debug then
    log("All Exports: \n" .. serpent.block(exports) .. "\n")
    log("AO: Auto-Recipe generation complete\n\n\n")
end
for _, recipe in pairs(exports) do
    data:extend({ recipe })
end
