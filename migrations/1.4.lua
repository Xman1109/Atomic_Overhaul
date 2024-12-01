for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipe = force.recipes

        if technologies["heating-oil"].researched then
            recipe["heat-tank-bottling"].enabled = true
        end
    end