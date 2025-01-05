ao_debug = settings.startup["ao-debug"].value


function FixUraniumResources()
    local ao_enrichUranium = (not script.active_mods["SchallUraniumProcessing"]) and
    settings.startup["ao-complexity-level"].value == "simple"
    local ao_breeder = (not script.active_mods["Nuclear Fuel"]) and
    settings.startup["ao-complexity-level"].value == "simple" and
    settings.startup["ao-breeder"].value
    if game.forces["player"].technologies["uranium-processing"].researched and ao_enrichUranium then
        game.forces["player"].recipes["uranium-low-enriched"].enabled = true
        game.forces["player"].recipes["uranium-235"].enabled = true
    end
    
    for i, force in pairs(game.forces) do
        if ao_breeder and ao_enrichUranium then
            force.technologies["kovarex-enrichment-process"].enabled = false
            force.recipes["kovarex-enrichment-process"].enabled = false
        else
            force.technologies["kovarex-enrichment-process"].enabled = true
            if force.technologies["kovarex-enrichment-process"].researched then
                force.recipes["kovarex-enrichment-process"].enabled = true
            end
        end
    end
end

for name, _ in pairs(script.active_mods) do
    if name == "Krastorio2" then
        require("scripts.krastorio2")
        if ao_debug then
            log("Atomic Overhaul: Krastorio 2 detected, loading compatibility script")
        end
    else
        function InitK2Radioactive() end
        function ConfigK2Radioactive() end
    end
    -- if name == "AbandonedRuins" then -- not ready yet
    --     require("scripts.ruins-mod")
    --     if ao_debug then
    --         log("Atomic Overhaul: Ruins detected, loading compatibility script")
    --     end
    -- end
    if name == "informatron" then
        require("scripts.informatron")
        if ao_debug then
            log("Atomic Overhaul: Informatron detected, loading compatibility script")
        end
    end
end

if settings.startup["heat-accumulator"].value == true then
    require("scripts.entity.heat-tank")
end

require("scripts.compatibility")
require("scripts.remote-interface")
require("scripts.rr-centrifuge") -- there is a bug connected with this


-- checking if the mod is loaded on a used savegame for the first time
script.on_init(function()
    if (settings.startup["ao-complexity-level"].value ~= "simple") then -- Why should mod always threaten player?
        game.print(
            "\nNOTE: If Atomic Overhaul has been added to an already existing savegame, you may need to troubleshoot your nuclear processing.\n")
    end
    InitK2Radioactive()
    storage.ao_heat_tank = storage.ao_heat_tank or {}
end)

script.on_configuration_changed(function()
    local recipe = game.forces["player"].recipes
    local technology = game.forces["player"].technologies
    -- if (settings.startup["ao-complexity-level"].value ~= "simple") then --no graphite in Simplified -- Discontinued the old way of making graphite
    --     game.print(
    --         "\nAtomic Overhaul now features a new way of creating Graphite.\nIf you dont like it, you can disable it in the mod settings.\n")
    -- end
    FixUraniumResources()
    ConfigK2Radioactive()
    if settings.startup["ao-isotope-update"].value == true then
        storage.ao_cold_fusion = storage.ao_cold_fusion or {}
    end


    if not (ao_kovarex == nil) then
        if settings.startup["ao-kovarex-enabled"].value == true then
            if technology["kovarex-enrichment-process"].researched then
                recipe["kovarex-enrichment-process"].enabled = true
                recipe["nuclear-fuel"].enabled = true
            end
        else
            if technology["plutonium-fuel"].researched then
                recipe["nuclear-fuel"].enabled = true
            end
        end
    else
        if ao_debug then
            log("Atomic Overhaul: Kovarex Enrichment Process managed by another mod.")
        end
    end

    -- if player name is "X_Man1109" print a personal message
    if game.players ~= nil then                 --
        if game.players[1] ~= nil then          -- This happens when factorio has its 5 minutes again...
            if game.players[1].name ~= nil then --
                if game.players[1].name == "X_Man11092006" then
                    local ao_version = "1.4.0"
                    game.print("Atomic Overhaul Version " .. ao_version)
                end
            end
        end
    end
end)

script.on_event(defines.events.on_trigger_created_entity , function(event)
    if settings.startup["ao-isotope-update"].value == true then
        UpgradeCapsules(event)
    end
end)

script.on_event(defines.events.on_entity_died, function(event)
    if settings.startup["ao-isotope-update"].value == true then
        whenReactorIsMissing(event)
        IsotopeConversion(event)
    end
end)

script.on_event(defines.events.on_player_mined_entity, function(event)
    if settings.startup["ao-isotope-update"].value == true then
        whenReactorIsMissing(event)
    end
end)

script.on_event(defines.events.on_robot_mined_entity, function(event)
    if settings.startup["ao-isotope-update"].value == true then
        whenReactorIsMissing(event)
    end
end)

script.on_event(defines.events.on_picked_up_item, function(event)
    if settings.startup["ao-isotope-update"].value == true then
        IsotopeTech(event)
    end
end)

script.on_event(defines.events.on_research_finished, function(event)
    rrCentrifuge(event)
    if settings.startup["ao-isotope-update"].value == true then
        IsotopeAnalysis(event)
        X17Tech(event)
    end
end)

script.on_event(defines.events.on_built_entity, function(event)
    HeatTank(event)
    if settings.startup["ao-isotope-update"].value == true then
        ColdFusionReactor(event)
    end
end)



-- 1.4.0
if settings.startup["ao-isotope-update"].value == true then
    log("Atomic Overhaul: Isotope Update scripts loading...")
    if not storage.ao_scrap then
        storage.ao_scrap = false
    end
    require("scripts.entity.isotope-conversion")
    require("scripts.entity.upgrade-capsules")
    require("scripts.entity.cold-fusion-reactor")
    require("scripts.isotope-tech")
    require("scripts.isotope-analysis")
    require("scripts.X17-tech")

end
