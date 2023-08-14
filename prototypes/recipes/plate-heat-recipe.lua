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

local function recipeProductMatchesSearchterms(recipe, searchterms)
    if data.raw["recipe"][recipe.name].normal then
        if data.raw["recipe"][recipe.name].normal.result then
            for _, i in pairs(searchterms) do
                if recipe.normal.result:find(i) then
                    return true
                end
            end
        elseif data.raw["recipe"][recipe.name].normal.results then
            for k4, result in pairs(data.raw["recipe"][recipe.name].normal.results) do
                for _, i in pairs(searchterms) do
                    if result[1] then
                        if result[1]:find(i) then
                            return true
                        end
                    elseif result.name then
                        if result.name:find(i) then
                            return true
                        end
                    end
                end
            end
        end
    elseif data.raw["recipe"][recipe.name].expensive then
        if data.raw["recipe"][recipe.name].expensive.result then
            for _, i in pairs(searchterms) do
                if recipe.expensive.result:find(i) then
                    return true
                end
            end
        elseif data.raw["recipe"][recipe.name].expensive.results then
            for k4, result in pairs(data.raw["recipe"][recipe.name].expensive.results) do
                for _, i in pairs(searchterms) do
                    if result[1] then
                        if result[1]:find(i) then
                            return true
                        end
                    elseif result.name then
                        if result.name:find(i) then
                            return true
                        end
                    end
                end
            end
        end
    elseif data.raw["recipe"][recipe.name].result then
        for _, i in pairs(searchterms) do
            if recipe.result:find(i) then
                return true
            end
        end
    elseif data.raw["recipe"][recipe.name].results then
        for k4, result in pairs(data.raw["recipe"][recipe.name].results) do
            for _, i in pairs(searchterms) do
                if result[1] then
                    if result[1]:find(i) then
                        return true
                    end
                elseif result.name then
                    if result.name:find(i) then
                        return true
                    end
                end
            end
        end
    end

    return false
end


local cc = nil
local exports = {}
local setting_searchterms = settings.startup["heat-algo-searchterm"].value
local searchterms = {}
local testrecipes = { "iron-plate", "copper-plate", "stone-brick", "angelsore1-crushed-smelting" }

if ao_debug then
    log("\n\n\n---AO: Auto-Recipe generation started---")
end

for _, recipe in pairs(testrecipes) do
    if data.raw.recipe[recipe] then
        if data.raw.recipe[recipe].category then
            if data.raw["recipe"][recipe].category ~= "crafting" then
                cc = data.raw.recipe[recipe].category
                if ao_debug then
                    log("Found category " .. cc)
                end
                break
            end
        end
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

    for k, resource in pairs(data.raw["resource"]) do
        if resource.minable.result then
            for k2, recipe in pairs(data.raw["recipe"]) do
                if data.raw["recipe"][recipe.name].category == cc then
                    if data.raw["recipe"][recipe.name].ingredients then
                        for k3, ingredient in pairs(data.raw["recipe"][recipe.name].ingredients) do
                            if ingredient[1] == data.raw["resource"][resource.name].minable.result then
                                if recipeProductMatchesSearchterms(recipe, searchterms) then
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


elseif settings.startup["heat-algo-mode"].value == "basic" then
    if ao_debug then
        log("Basic Heat Algorithm Mode")
    end

    for k2, recipe in pairs(data.raw["recipe"]) do
        if data.raw["recipe"][recipe.name].category == cc then
            if data.raw["recipe"][recipe.name].normal then
                if data.raw["recipe"][recipe.name].normal.result then
                    for _, i in pairs(searchterms) do
                        if recipe.normal.result:find(i) then
                            local newRecipe = deriveNewHeatRecipe(recipe)
                            if ao_debug then
                                log("Copied Smelting Recipe: " .. newRecipe.name)
                            end
                            --data:extend({ newRecipe })
                            table.insert(exports, newRecipe)
                        end
                    end
                elseif data.raw["recipe"][recipe.name].normal.results then
                    for k4, result in pairs(data.raw["recipe"][recipe.name].normal.results) do
                        for _, i in pairs(searchterms) do
                            if result[1] then
                                if result[1]:find(i) then
                                    local newRecipe = deriveNewHeatRecipe(recipe)
                                    if ao_debug then
                                        log("Copied Smelting Recipe: " .. newRecipe.name)
                                    end
                                    --data:extend({ newRecipe })
                                    table.insert(exports, newRecipe)
                                end
                            elseif result.name then
                                if result.name:find(i) then
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
            elseif data.raw["recipe"][recipe.name].result then
                for _, i in pairs(searchterms) do
                    if recipe.result:find(i) then
                        local newRecipe = deriveNewHeatRecipe(recipe)
                        if ao_debug then
                            log("Copied Smelting Recipe: " .. newRecipe.name)
                        end
                        --data:extend({ newRecipe })
                        table.insert(exports, newRecipe)
                    end
                end
            elseif data.raw["recipe"][recipe.name].results then
                for k4, result in pairs(data.raw["recipe"][recipe.name].results) do
                    for _, i in pairs(searchterms) do
                        if result[1] then
                            if result[1]:find(i) then
                                local newRecipe = deriveNewHeatRecipe(recipe)
                                if ao_debug then
                                    log("Copied Smelting Recipe: " .. newRecipe.name)
                                end
                                --data:extend({ newRecipe })
                                table.insert(exports, newRecipe)
                            end
                        elseif result.name then
                            if result.name:find(i) then
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


if ao_debug then
    log("All Exports: \n" .. serpent.block(exports) .. "\n")
    log("AO: Auto-Recipe generation complete\n\n\n")
end
for _, recipe in pairs(exports) do
    data:extend({ recipe })
end
