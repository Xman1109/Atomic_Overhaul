if settings.startup["complexity-level"].value ~= "simple" then
    for index, force in pairs(game.forces) do
        local technologies = force.technologies
        local recipe = force.recipes

        if technologies["nuclear-fuel-reprocessing"].researched then
            recipe["research-data-recipe"].enabled = true
        end
    end
end