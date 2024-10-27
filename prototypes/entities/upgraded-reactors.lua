local list = { "nuclear-reactor" }

--clone every reactor from list (table.deepcopy)
for _, reactor in pairs(list) do
    if not data.raw["reactor"][reactor] then
        log("Reactor " .. reactor .. " not found")
    else

        local entity_cooled = table.deepcopy(data.raw["reactor"][reactor]) -- cooling-upgrade
        local entity_catalyser = table.deepcopy(data.raw["reactor"][reactor]) -- catalyser-upgrade
        local entity_shielded = table.deepcopy(data.raw["reactor"][reactor]) -- shielded-upgrade

        entity_cooled.name = "cooled-" .. reactor
        entity_cooled.minable.result = "cooled-" .. reactor
        --string-split in number and unit (10MJ -> 10, MJ)
        local number, unit = entity_cooled.heat_buffer.max_transfer:match("([%d%.]+)(%a+)")
        entity_cooled.heat_buffer.max_transfer = tonumber(number) * 1.5 .. unit
        local number, unit = entity_cooled.heat_buffer.specific_heat:match("([%d%.]+)(%a+)")
        entity_cooled.heat_buffer.specific_heat = tonumber(number) * 1.5 .. unit
        entity_cooled.localised_name = {"", {"entity-name." .. reactor}, " (", {"item-name.cooling-upgrade"}, ")"}
        entity_cooled.localised_description = {"", {"entity-name." .. reactor}, {"item-strings.upgrade-description"}, {"item-name.cooling-upgrade"}}

        entity_catalyser.name = "catalyser-" .. reactor
        entity_catalyser.minable.result = "catalyser-" .. reactor
        local number, unit = entity_catalyser.consumption:match("([%d%.]+)(%a+)")
        entity_catalyser.consumption = tonumber(number) * 0.5 .. unit
        entity_catalyser.energy_source.effectivity = entity_catalyser.energy_source.effectivity * 1.5
        entity_catalyser.localised_name = {"", {"entity-name." .. reactor}, " (", {"item-name.catalyser-upgrade"}, ")"}
        entity_catalyser.localised_description = {"", {"entity-name." .. reactor}, {"item-strings.upgrade-description"}, {"item-name.catalyser-upgrade"}}

        entity_shielded.name = "shielded-" .. reactor
        entity_shielded.minable.result = "shielded-" .. reactor
        entity_shielded.max_health = entity_shielded.max_health * 1.5
        local number, unit = entity_shielded.consumption:match("([%d%.]+)(%a+)")
        entity_shielded.consumption = tonumber(number) * 1.5 .. unit
        entity_shielded.localised_name = {"", {"entity-name." .. reactor}, " (", {"item-name.shielded-upgrade"}, ")"}
        entity_shielded.localised_description = {"", {"entity-name." .. reactor}, {"item-strings.upgrade-description"}, {"item-name.shielded-upgrade"}}

        data:extend({ entity_cooled, entity_catalyser, entity_shielded })
        if ao_debug then
            log("AO_DEBUG: Reactor " .. reactor .. " cloned")
        end
    end
end
