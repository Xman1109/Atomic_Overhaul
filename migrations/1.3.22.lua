for index, force in pairs(game.forces) do
    local technologies = force.technologies
    local recipe = force.recipes

        if technologies["nuclear-fuel-reprocessing"].researched and settings.startup["ao-complexity-level"].value ~= "simple" then
            recipe["research-data-recipe"].enabled = true
        end
    end