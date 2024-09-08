function FixUraniumResources()
    local ao_enrichUranium = (not game.active_mods["SchallUraniumProcessing"]) and
        settings.startup["ao-complexity-level"].value == "simple"
    local ao_breeder = (not game.active_mods["Nuclear Fuel"]) and
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

-- checking if the mod is loaded on a used savegame for the first time
script.on_init(function()
    if (settings.startup["ao-complexity-level"].value ~= "simple") then -- Why should mod always threaten player?
        game.print(
            "\nNOTE: If Atomic Overhaul has been added to an already existing savegame, you may need to troubleshoot your nuclear processing.\n")
    end
end)

script.on_configuration_changed(function()
    -- if (settings.startup["ao-complexity-level"].value ~= "simple") then --no graphite in Simplified -- Discontinued the old way of making graphite
    --     game.print(
    --         "\nAtomic Overhaul now features a new way of creating Graphite.\nIf you dont like it, you can disable it in the mod settings.\n")
    -- end
    FixUraniumResources()
    -- if player name is "X_Man1109" or "fainda" print a personal message
    if game.players[1].name == "X_Man11092006" then
        local ao_version = "1.4.0"
        game.print("Atomic Overhaul Version " .. ao_version)
    else
        game.print(game.players[1].name)
    end
end)

if settings.startup["heat-accumulator"].value == true then
    require("scripts.entity.heat-tank")
end

require("scripts.compatibility")
require("scripts.remote-interface")
for name, _ in pairs(script.active_mods) do
    if name == "Krastorio2" then
        require("scripts.krastorio2")
        if ao_debug then
            log("Atomic Overhaul: Krastorio 2 detected, loading compatibility script")
        end
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


-- 1.4.0
if not global.ao_scrap then
    global.ao_scrap = false
end
require("scripts.entity.isotope-conversion")
require("scripts.isotope-tech")