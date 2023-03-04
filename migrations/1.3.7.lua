if settings.startup["ao-complexity-level"].value ~= "simple" then
    for index, force in pairs(game.forces) do
        local technologies = force.technologies
        local recipe = force.recipes

        if settings.startup["se-addon"].value == true and technologies["se-delivery-cannon-capsule-iridium"] ~= nil then
            if technologies["se-delivery-cannon-capsule-iridium"].researched then
                recipe["lead-delivery-recipe"].enabled = true
            end
        end
    end
end
