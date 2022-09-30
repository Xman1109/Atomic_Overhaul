if settings.startup["heat-algo-mode"] ~= "off" then
    local cc = nil
    local setting_searchterms = settings.startup["heat-algo-searchterm"].value
    local searchterms = {}
    local testrecipes = { "iron-plate", "copper-plate", "stone-brick", "angelsore1-crushed-smelting" }

    for _, recipe in pairs(testrecipes) do
        if data.raw.recipe[recipe] then
            if data.raw.recipe[recipe].category then
                if data.raw["recipe"][recipe].category ~= "crafting" then
                    cc = data.raw.recipe[recipe].category
                    break
                end
            end
        end
    end

    for word in string.gmatch(setting_searchterms, '([^, ]+)') do
        table.insert(searchterms, word)
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
                                    if data.raw["recipe"][recipe.name].result then
                                        for _, i in pairs(searchterms) do
                                            if recipe.result:find(i) then
                                                local newRecipe = table.deepcopy(recipe)
                                                newRecipe.name = recipe.name .. "-heat"
                                                newRecipe.category = "heat-furnace"
                                                local isunlockedbytech = false
                                                for k4, tech in pairs(data.raw["technology"]) do
                                                    if tech.effects then
                                                        for k5, effect in pairs(tech.effects) do
                                                            if effect.recipe == recipe.name then
                                                                table.insert(data.raw["technology"][tech.name].effects,
                                                                    { type = "unlock-recipe", recipe = newRecipe.name })
                                                                isunlockedbytech = true
                                                            end

                                                        end
                                                    end
                                                end
                                                if isunlockedbytech == false then
                                                    newRecipe.enabled = true
                                                else
                                                    newRecipe.enabled = false
                                                end
                                                if ao_debug then
                                                    log("Copied Smelting Recipe: " .. newRecipe.name)
                                                end
                                                data:extend({ newRecipe })
                                            end
                                        end
                                    elseif data.raw["recipe"][recipe.name].results then
                                        for k4, result in pairs(data.raw["recipe"][recipe.name].results) do
                                            for _, i in pairs(searchterms) do
                                                if result.name:find(i) then
                                                    local newRecipe = table.deepcopy(recipe)
                                                    newRecipe.name = recipe.name .. "-heat"
                                                    newRecipe.category = "heat-furnace"
                                                    local isunlockedbytech = false
                                                    for k4, tech in pairs(data.raw["technology"]) do
                                                        if tech.effects then
                                                            for k5, effect in pairs(tech.effects) do
                                                                if effect.recipe == recipe.name then
                                                                    table.insert(data.raw["technology"][tech.name].effects
                                                                        ,
                                                                        { type = "unlock-recipe", recipe = newRecipe.name })
                                                                    isunlockedbytech = true
                                                                end

                                                            end
                                                        end
                                                    end
                                                    if isunlockedbytech == false then
                                                        newRecipe.enabled = true
                                                    else
                                                        newRecipe.enabled = false
                                                    end
                                                    if ao_debug then
                                                        log("Copied Smelting Recipe: " .. newRecipe.name)
                                                    end
                                                    data:extend({ newRecipe })
                                                end
                                            end
                                        end
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
                if data.raw["recipe"][recipe.name].ingredients then
                    if data.raw["recipe"][recipe.name].result then
                        for _, i in pairs(searchterms) do
                            if recipe.result:find(i) then
                                local newRecipe = table.deepcopy(recipe)
                                newRecipe.name = recipe.name .. "-heat"
                                newRecipe.category = "heat-furnace"
                                local isunlockedbytech = false
                                for k4, tech in pairs(data.raw["technology"]) do
                                    if tech.effects then
                                        for k5, effect in pairs(tech.effects) do
                                            if effect.recipe == recipe.name then
                                                table.insert(data.raw["technology"][tech.name].effects,
                                                    { type = "unlock-recipe", recipe = newRecipe.name })
                                                isunlockedbytech = true
                                            end
                                        end
                                    end
                                end
                                if isunlockedbytech == false then
                                    newRecipe.enabled = true
                                else
                                    newRecipe.enabled = false
                                end
                                if ao_debug then
                                    log("Copied Smelting Recipe: " .. newRecipe.name)
                                end
                                data:extend({ newRecipe })
                            end
                        end
                    elseif data.raw["recipe"][recipe.name].results then
                        for k4, result in pairs(data.raw["recipe"][recipe.name].results) do
                            for _, i in pairs(searchterms) do
                                if result.name:find(i) then
                                    local newRecipe = table.deepcopy(recipe)
                                    newRecipe.name = recipe.name .. "-heat"
                                    newRecipe.category = "heat-furnace"
                                    local isunlockedbytech = false
                                    for k4, tech in pairs(data.raw["technology"]) do
                                        if tech.effects then
                                            for k5, effect in pairs(tech.effects) do
                                                if effect.recipe == recipe.name then
                                                    table.insert(data.raw["technology"][tech.name].effects,
                                                        { type = "unlock-recipe", recipe = newRecipe.name })
                                                    isunlockedbytech = true
                                                end
                                            end

                                        end
                                    end
                                    if isunlockedbytech == false then
                                        newRecipe.enabled = true
                                    else
                                        newRecipe.enabled = false
                                    end
                                    if ao_debug then
                                        log("Copied Smelting Recipe: " .. newRecipe.name)
                                    end
                                    data:extend({ newRecipe })
                                end
                            end
                        end
                    end
                end
            end
        end

    end
end
