for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipe = force.recipes
    if settings.startup["ao-complexity-level"].value == "simple" then

    else
        if technologies["uranium-processing"].researched then
            if technologies["ao-graphite-processing"] then
                technologies["ao-graphite-processing"].researched = true
            end
            if technologies["graphite-processing"] then
                technologies["graphite-fuel-reprocessing"].researched = true
            end
        end
        if technologies["plutonium-processing"].researched then
            technologies["MOX-processing"].researched = true
            technologies["MOX-fuel-reprocessing"].researched = true
        end
        if recipe["MOX-fuel-cell-recipe"].enabled then
            recipe["MOX-recipe"].enabled = true
            recipe["MOX-reprocessing"].enabled = true
        end
    end
end
