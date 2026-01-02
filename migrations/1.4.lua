for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipe = force.recipes

        if settings.startup["ao-complexity-level"].value ~= "simple" and technologies["heating-oil"].researched then
            recipe["heat-tank-bottling"].enabled = true
        end
    end