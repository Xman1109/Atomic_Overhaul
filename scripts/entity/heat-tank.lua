if settings.startup["ao-complexity-level"].value ~= "simple" then
script.on_nth_tick(60, function(event) --TODO: change to smth more reasonable  -- runs every 60 ticks
    for k, v in pairs(game.surfaces) do -- for each surface in the game
        if game.surfaces[v.name].find_entities_filtered { name = "heat-fluid-tank" } then -- if there are any heat-fluid-tanks on the surface
            for i, j in pairs(game.surfaces[v.name].find_entities_filtered { name = "heat-fluid-tank" }) do -- for each heat-fluid-tank on the surface
                if j.valid then -- if the heat-fluid-tank is valid
                    local x = j.position.x
                    local y = j.position.y
                    local fluidBox = j.fluidbox[1]
                    if fluidBox then -- if the heat-fluid-tank has a fluidbox
                        local fluidName = fluidBox.name
                        local fluidAmount = fluidBox.amount
                        if fluidName == "water" and fluidAmount > 24500 then -- if the fluid is water(heating oil) and there is more than 24.500 units of it
                            j.destroy() -- destroy the heat-fluid-tank
                            local newEntity = game.surfaces[v.name].create_entity { name = "heat-tank-pipe", position = {
                                x = x, y = y }, force = "player" } -- create a new heat-tank-pipe at the same position
                        end
                    end
                end
            end
        end
    end
end)
end