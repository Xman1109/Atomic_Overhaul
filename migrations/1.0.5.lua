for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipe = force.recipes

    if technologies["uranium-processing"].researched then
        technologies["graphite-processing"].researched = true
        technologies["graphite-fuel-reprocessing"].researched = true
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