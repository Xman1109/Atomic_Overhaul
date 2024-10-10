local list = { "nuclear-reactor" }

--clone every reactor from list (table.deepcopy)
for _, reactor in pairs(list) do
    if not data.raw["item"][reactor] then
        log("Item " .. reactor .. " not found")
    else

        local item_cooled = table.deepcopy(data.raw["item"][reactor]) -- cooling-upgrade
        local item_catalyser = table.deepcopy(data.raw["item"][reactor]) -- catalyser-upgrade
        local item_shielded = table.deepcopy(data.raw["item"][reactor]) -- shielded-upgrade

        item_cooled.name = "cooled-" .. reactor
        item_cooled.icon = graphics .. "cooling-upgrade.png"
        item_cooled.icon_size = 64
        item_cooled.icon_mipmaps = 4
        item_cooled.place_result = "cooled-" .. reactor
        item_cooled.localised_name = {"", {"entity-name." .. reactor}, " (", {"item-name.cooling-upgrade"}, ")"}
        item_cooled.localised_description = {"", {"entity-name." .. reactor}, {"item-strings.upgrade-description"}, {"item-name.cooling-upgrade"}}

        item_catalyser.name = "catalyser-" .. reactor
        item_catalyser.icon = graphics .. "catalyser-upgrade.png"
        item_catalyser.icon_size = 64
        item_catalyser.icon_mipmaps = 4
        item_catalyser.place_result = "catalyser-" .. reactor
        item_catalyser.localised_name = {"", {"entity-name." .. reactor}, " (", {"item-name.catalyser-upgrade"}, ")"}
        item_catalyser.localised_description = {"", {"entity-name." .. reactor}, {"item-strings.upgrade-description"}, {"item-name.catalyser-upgrade"}}

        item_shielded.name = "shielded-" .. reactor
        item_shielded.icon = graphics .. "shielded-upgrade.png"
        item_shielded.icon_size = 64
        item_shielded.icon_mipmaps = 4
        item_shielded.place_result = "shielded-" .. reactor
        item_shielded.localised_name = {"", {"entity-name." .. reactor}, " (", {"item-name.shielded-upgrade"}, ")"}
        item_shielded.localised_description = {"", {"entity-name." .. reactor}, {"item-strings.upgrade-description"}, {"item-name.shielded-upgrade"}}

        data:extend({ item_cooled, item_catalyser, item_shielded })

        if ao_debug then
            log("AO_DEBUG: Item " .. reactor .. " cloned")
        end
    end
end
