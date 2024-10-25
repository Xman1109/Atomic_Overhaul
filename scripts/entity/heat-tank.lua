script.on_init(function()
    storageao_heat_tank = storageao_heat_tank or {}
end)

if settings.startup["ao-complexity-level"].value ~= "simple" then
    script.on_event(defines.events.on_built_entity, function(event)

        
        --LOGGING STAGE BEGINS HERE
        storageao_heat_tank = storageao_heat_tank or {}
        local entity = event.created_entity
        local length = 1
        if entity.name == "heat-fluid-tank" then
            local x = entity.position.x
            local y = entity.position.y
            local surface = event.created_entity.surface.name

            if storageao_heat_tank[surface] == nil then
                storageao_heat_tank[surface] = {}
            end
            for i, v in pairs(storageao_heat_tank[surface]) do
                length = length + 1
            end
            table.insert(storageao_heat_tank[surface], length, { x = x, y = y })
        end
        --LOGGING STAGE ENDS HERE


        -- check if the tanks are still existing and remove them from the table if not
        for i, v in pairs(storageao_heat_tank) do
            for j, k in pairs(v) do
                if game.surfaces[i].find_entities_filtered { position = k, type = "storage-tank" }[1] == nil then
                    table.remove(storageao_heat_tank[i], j)
                else
                    -- check if the tank has a fluidbox and if it has, check if it is heating oil and if it is, check if it has more than 24.500 units of it
                    if game.surfaces[i].find_entities_filtered { position = k }[1] then
                        if game.surfaces[i].find_entities_filtered { position = k }[1].fluidbox then
                            if game.surfaces[i].find_entities_filtered { position = k }[1].fluidbox[1] then
                                if game.surfaces[i].find_entities_filtered { position = k }[1].fluidbox[1].name == "heating-oil" then
                                    if game.surfaces[i].find_entities_filtered { position = k }[1].fluidbox[1].amount > 24500 then
                                        game.surfaces[i].find_entities_filtered { position = k }[1].destroy()
                                        game.surfaces[i].create_entity { name = "heat-tank-pipe", position = k, force =
                                        "player" }
                                        local player = game.players[event.player_index]
                                        player.print({ "", {"chat-message.heat-fluid-tank"}, "\n[gps=" ..
                                            k.x .. "," .. k.y .. "," .. i .. "]"})
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end
