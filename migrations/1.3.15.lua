if settings.startup["ao-complexity-level"].value ~= "simple" then
    for index, force in pairs(game.forces) do
        local technologies = force.technologies
        local recipe = force.recipes

        if technologies["uranium-processing"].researched then
            recipe["uranium-rod-recipe"].enabled = true
        end
        if technologies["plutonium-processing"].researched then
            recipe["plutonium-rod-recipe"].enabled = true
        end
        if technologies["MOX-fuel-reprocessing"].researched then
            recipe["MOX-rod-recipe"].enabled = true
        end
        if technologies["thorium-processing"].researched then
            recipe["thorium-rod-recipe"].enabled = true
        end

        if settings.startup["se-addon"].value == true and technologies["se-processing-iridium"] ~= nil then
            if technologies["iridium-192-processing"].researched then
                recipe["iridium-rod-recipe"].enabled = true
            end
            if technologies["holmium-166-processing"].researched then
                recipe["holmium-rod-recipe"].enabled = true
            end
            if technologies["beryllium-7-processing"].researched then
                recipe["beryllium-rod-recipe"].enabled = true
            end
        end
    end
end
