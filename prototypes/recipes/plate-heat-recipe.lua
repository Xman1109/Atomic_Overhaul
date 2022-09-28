local cc = data.raw["furnace"]["stone-furnace"].crafting_categories[1]


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
                                    if recipe.result:find("plate") then
                                        local newRecipe = table.deepcopy(recipe)
                                        newRecipe.name = recipe.name .. "-heat"
                                        newRecipe.category = "heat-furnace"
                                        newRecipe.enabled = true
                                        if ao_debug then
                                            log("Copied Smelting Recipe: " .. newRecipe.name)
                                        end
                                        data:extend({ newRecipe })
                                    end
                                elseif data.raw["recipe"][recipe.name].results then
                                    for k4, result in pairs(data.raw["recipe"][recipe.name].results) do
                                        if result.name:find("plate") then
                                            local newRecipe = table.deepcopy(recipe)
                                            newRecipe.name = recipe.name .. "-heat"
                                            newRecipe.category = "heat-furnace"
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


elseif settings.startup["heat-algo-mode"].value == "basic" then
    if ao_debug then
        log("Basic Heat Algorithm Mode")
    end

    for k2, recipe in pairs(data.raw["recipe"]) do
        if data.raw["recipe"][recipe.name].category == cc then
            if data.raw["recipe"][recipe.name].ingredients then
                if data.raw["recipe"][recipe.name].result then
                    if recipe.result:find("plate") then
                        local newRecipe = table.deepcopy(recipe)
                        newRecipe.name = recipe.name .. "-heat"
                        newRecipe.category = "heat-furnace"
                        if ao_debug then
                            log("Copied Smelting Recipe: " .. newRecipe.name)
                        end
                        data:extend({ newRecipe })
                    end
                elseif data.raw["recipe"][recipe.name].results then
                    for k4, result in pairs(data.raw["recipe"][recipe.name].results) do
                        if result.name:find("plate") then
                            local newRecipe = table.deepcopy(recipe)
                            newRecipe.name = recipe.name .. "-heat"
                            newRecipe.category = "heat-furnace"
                            newRecipe.enabled = true
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
