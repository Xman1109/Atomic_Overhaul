-- if settings.startup["ao-complexity-level"].value ~= "simple" then
--     script.on_nth_tick(600, function(event)
--         for k, v in pairs(game.surfaces) do                                                                 -- for each surface in the game
--             if game.surfaces[v.name].find_entities_filtered { name = "heat-fluid-tank" } then               -- if there are any heat-fluid-tanks on the surface
--                 for i, j in pairs(game.surfaces[v.name].find_entities_filtered { name = "heat-fluid-tank" }) do -- for each heat-fluid-tank on the surface
--                     if j.valid then                                                                         -- if the heat-fluid-tank is valid
--                         local x = j.position.x
--                         local y = j.position.y
--                         local fluidBox = j.fluidbox[1]
--                         if fluidBox then -- if the heat-fluid-tank has a fluidbox
--                             local fluidName = fluidBox.name
--                             local fluidAmount = fluidBox.amount
--                             if fluidName == "heating-oil" and fluidAmount > 24500 then -- if the fluid is heating oil and there is more than 24.500 units of it
--                                 j.destroy()                                        -- destroy the heat-fluid-tank
--                                 local newEntity = game.surfaces[v.name].create_entity { name = "heat-tank-pipe", position = {
--                                     x = x, y = y }, force = "player" }             -- create a new heat-tank-pipe at the same position + the same force
--                             end
--                         end
--                     end
--                 end
--             end
--         end
--     end)
-- end

script.on_init(function()
    global.ao_heat_tank = global.ao_heat_tank or {}
end)

if settings.startup["ao-complexity-level"].value ~= "simple" then
    script.on_event(defines.events.on_built_entity, function(event)
        global.ao_heat_tank = global.ao_heat_tank or {}
        local entity = event.created_entity
        local length = 0
        if entity.name == "heat-fluid-tank" then
            local x = entity.position.x
            local y = entity.position.y
            local surface = event.created_entity.surface.name

            if global.ao_heat_tank[surface] == nil then
                global.ao_heat_tank[surface] = {}
            end
            for i, v in pairs(global.ao_heat_tank[surface]) do
                length = length + 1
            end
            table.insert(global.ao_heat_tank[surface], length, { x = x, y = y })
        end

        -- check if the tanks are still existing and remove them from the table if not
        for i, v in pairs(global.ao_heat_tank) do
            for j, k in pairs(v) do
                if not game.surfaces[i].find_entities_filtered { position = k } then
                    game.print("removed a tank from the table at:" .. k.x .. "," .. k.y .. ", " .. i) --TODO: FEHLER LIEGT HIERIN (vermutlich)
                    table.remove(global.ao_heat_tank[i], j)
                else
                    game.print("did not remove a tank from the table at:" .. k.x .. "," .. k.y .. ", " .. i)
                    -- check if the tank has a fluidbox and if it has, check if it is heating oil and if it is, check if it has more than 24.500 units of it
                    if game.surfaces[i].find_entities_filtered { position = k }[1].fluidbox[1] then
                        game.print(game.surfaces[i].find_entities_filtered { position = k }[1].fluidbox[1].name)
                        if game.surfaces[i].find_entities_filtered { position = k }[1].fluidbox[1].name == "heating-oil" then
                            game.print(game.surfaces[i].find_entities_filtered { position = k }[1].fluidbox[1].name)
                            if game.surfaces[i].find_entities_filtered { position = k }[1].fluidbox[1].amount > 24500 then
                                game.print(game.surfaces[i].find_entities_filtered { position = k }[1].fluidbox[1].amount)
                                game.surfaces[i].find_entities_filtered { position = k }[1].destroy()
                                game.surfaces[i].create_entity { name = "heat-tank-pipe", position = k, force =
                                "player" }
                                local player = game.players[event.player_index]
                                player.print("Conversion happened at: [gps= " ..
                                    k.x .. "," .. k.y .. ", " .. i .. "]") --TODO: Das Game crasht ? Und es wird nur converted wenn ein weiterer tank platziert wird
                                -- also mach ma ne funktion draus die bei jedem on_build_entity event aufgerufen wird
                            end
                        end
                    end
                end
            end
        end
    end)
end
