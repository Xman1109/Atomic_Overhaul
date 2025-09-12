function ColdFusionReactor(event)
    storage.ao_cold_fusion = storage.ao_cold_fusion or {}
    local entity = event.entity
    if entity.name == "cold-fusion-reactor" then
        local energy_interface = entity.surface.create_entity {
            name = "cold-fusion-energy",
            position = entity.position,
            force = entity.force
        }
        energy_interface.destructible = false
        table.insert(storage.ao_cold_fusion, { reactor = entity, energy_interface = energy_interface })
    end
end

function whenReactorIsMissing(event)
    storage.ao_cold_fusion = storage.ao_cold_fusion or {}
    if event.entity.name == "cold-fusion-reactor" then
        for i, pair in pairs(storage.ao_cold_fusion) do
            if pair.reactor == event.entity then
                if pair.energy_interface.valid then
                    pair.energy_interface.destroy()
                end
                table.remove(storage.ao_cold_fusion, i)
                break
            end
        end
    end
end

-- Periodic energy transfer based on reactor activity
script.on_nth_tick(60, function(event)
    if storage.ao_cold_fusion == nil then
        return
    end
    for _, pair in pairs(storage.ao_cold_fusion) do
        if pair.reactor.valid and pair.energy_interface.valid then
            local burner = pair.reactor.burner
            local energy_interface = pair.energy_interface

            -- If the reactor is running, transfer energy
            if burner.remaining_burning_fuel > 0 then
                -- check if the fluid_boxes with water are full
                local fluid_boxes = pair.reactor.fluidbox
                if fluid_boxes[1].amount > 10 then -- Xenon Supply
                    if fluid_boxes[2].amount < 200 then -- Water Drainage
                        energy_interface.energy = energy_interface.energy +
                            5 * 1000 * 1000 * 1000
                    end
                end
            end
        end
    end
end)
log("Atomic Overhaul: Cold Fusion Reactor script loaded")
