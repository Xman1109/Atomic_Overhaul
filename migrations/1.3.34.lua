for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipe = force.recipes

    if technologies["uranium-processing"].researched then
        technologies["non-moderated-fuel-processing"].researched = true
        technologies["non-moderated-fuel-processing"].enabled = true
        technologies["graphite-cooking"].researched = true
        technologies["graphite-cooking"].enabled = true
        technologies["non-moderated-fuel-reprocessing"].enabled = true
        technologies["non-moderated-fuel-reprocessing"].researched = true
        technologies["nuclear-power"].researched = true
        technologies["nuclear-power"].enabled = true
        technologies["uranium-mining"].researched = true
        technologies["uranium-mining"].enabled = true
        if recipe["empty-fuel-cell-recipe"].enabled == false then
            recipe["empty-fuel-cell-recipe"].enabled = true
        end
        if recipe["graphite-furnace-recipe"].enabled == false then
            recipe["graphite-furnace-recipe"].enabled = true
        end
        if recipe["heat-furnace-recipe"].enabled == false then
            recipe["heat-furnace-recipe"].enabled = true
        end
        if recipe["non-moderated-fuel-cell-recipe"].enabled == false then
            recipe["non-moderated-fuel-cell-recipe"].enabled = true
        end
    end
    if technologies["nuclear-fuel-reprocessing"].researched then
        recipe["research-data-recipe"].enabled = true
    end
end
