for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipe = force.recipes

        if settings.startup["ao-complexity-level"].value ~= "simple" and technologies["non-moderated-fuel-processing"].researched then
            recipe["centrifuge"].enabled = true
        end
    end