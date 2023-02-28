for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipe = force.recipes

    if settings.startup["old-graphite-fuel"].value == false then
        if technologies["uranium-processing"].researched then
            if settings.startup["complexity-level"].value ~= "simple" then
                technologies["non-moderated-fuel-processing"].researched = true
                recipe["empty-fuel-cell-recipe"].enabled = true
                recipe["non-moderated-fuel-cell-recipe"].enabled = true

                technologies["non-moderated-fuel-reprocessing"].researched = true
                recipe["non-moderated-fuel-reprocessing"].enabled = true

                technologies["graphite-cooking"].researched = true
                recipe["graphite-furnace-recipe"].enabled = true
            end
            recipe["uranium-processing"].enabled = true
            recipe["centrifuge"].enabled = true

            recipe["heat-furnace-recipe"].enabled = true
        end
        if settings.startup["complexity-level"].value ~= "simple" then
            recipe["graphite-fuel-cell-recipe"].enabled = false
            recipe["graphite-fuel-reprocessing"].enabled = false
            recipe["graphite-recipe"].enabled = false

            technologies["ao-graphite-processing"].researched = false
            technologies["graphite-fuel-reprocessing"].researched = false
            technologies["ao-graphite-processing"].enabled = false
            technologies["graphite-fuel-reprocessing"].enabled = false
        end
    end
end
