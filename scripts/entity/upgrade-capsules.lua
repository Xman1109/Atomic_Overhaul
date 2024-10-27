script.on_event(defines.events.on_trigger_created_entity, function(event)
    if event.entity.name == "cooling-upgrade-explosion" or event.entity.name == "catalyser-upgrade-explosion" or event.entity.name == "shielded-upgrade-explosion" then
        local upgrade
        local upgrade_name
        if event.entity.name == "cooling-upgrade-explosion" then
            upgrade = "cooling-upgrade"
            upgrade_name = "cooled-"
        elseif event.entity.name == "catalyser-upgrade-explosion" then
            upgrade = "catalyser-upgrade"
            upgrade_name = "catalyser-"
        elseif event.entity.name == "shielded-upgrade-explosion" then
            upgrade = "shielded-upgrade"
            upgrade_name = "shielded-"
        end
        -- Find entities (reactor) near the impact point
        local surface = event.entity.surface
        local position = event.entity.position

        local reactors = surface.find_entities_filtered({
            name = "nuclear-reactor",
            position = position,
            radius = 3 -- Check within a 2-tile radius
        })

        -- If a reactor is found, replace it with an upgraded reactor
        if #reactors > 0 then
            local old_reactor = reactors[1]
            local position = old_reactor.position
            local force = old_reactor.force
            local surface = old_reactor.surface

            -- Access the burner's remaining fuel progress and contents
            local burner = old_reactor.burner
            local current_fuel = burner.currently_burning         -- The current fuel item (e.g., "nuclear-fuel")
            local remaining_burnt = burner.remaining_burning_fuel -- The remaining fuel time in ticks

            -- Store the reactor's fuel and burnt inventory contents and temperature
            local fuel_contents = old_reactor.get_inventory(defines.inventory.fuel).get_contents()
            local burnt_contents = old_reactor.get_inventory(defines.inventory.burnt_result).get_contents()
            local temperature = old_reactor.temperature

            -- Destroy the old reactor
            old_reactor.destroy()

            -- Create the upgraded reactor at the same position
            local new_reactor = surface.create_entity({
                name = upgrade_name .. "nuclear-reactor", -- Ensure this upgraded reactor is defined in data.lua
                position = position,
                force = force
            })

            -- Restore fuel inventory to the new reactor
            if fuel_contents then
                local new_fuel_inventory = new_reactor.get_inventory(defines.inventory.fuel)
                for name, count in pairs(fuel_contents) do
                    new_fuel_inventory.insert({ name = name, count = count })
                end
            end

            -- Restore burnt inventory to the new reactor
            if burnt_contents then
                local new_burnt_inventory = new_reactor.get_inventory(defines.inventory.burnt_result)
                for name, count in pairs(burnt_contents) do
                    new_burnt_inventory.insert({ name = name, count = count })
                end
            end

            -- Restore temperature to the new reactor
            new_reactor.temperature = temperature

            -- Restore burner progress (fuel cell progress)
            if current_fuel then
                local new_burner = new_reactor.burner
                new_burner.currently_burning = current_fuel         -- Transfer the fuel item
                new_burner.remaining_burning_fuel = remaining_burnt -- Transfer the remaining burn time
            end

            -- Print message to the players about successful upgrade
            force.print({ "", {"chat-message.reactor-upgrade"}, " [gps=" .. position.x .. ", " .. position.y .. "]"})
        else
            -- Print message to the players if no reactor is found
            game.print({"", {"chat-message.no-reactor-found"}, " [gps=" .. position.x .. ", " .. position.y .. "]"})
            --Drop the capsule on the ground
            surface.spill_item_stack(
                position,                                -- Position of the item
                { name = upgrade, count = 1 }, -- Item to be spilled
                true                                     -- Enable the item to be picked up
            )
        end
    end
end)
