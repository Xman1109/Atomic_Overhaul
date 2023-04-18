-- checking if the mod is loaded on a used savegame for the first time
script.on_init(function()
    if (settings.startup["ao-complexity-level"].value ~= "simple") then -- Why should mod always threaten player?
        game.print(
            "\nNOTE: If Atomic Overhaul has been added to an already existing savegame, you may need to troubleshoot your nuclear processing.\n")
    end
end)

script.on_configuration_changed(function()
    if (settings.startup["ao-complexity-level"].value ~= "simple") then --no graphite in Simplified
        game.print(
            "\nAtomic Overhaul now features a new way of creating Graphite.\nIf you dont like it, you can disable it in the mod settings.\n")
    end
    FixUraniumResources()
end)

for name, _ in pairs(script.active_mods) do
    log(name)
    require("scripts.compatibility")
    require("scripts.remote-interface")
    if name == "Krastorio2" then
        require("scripts.krastorio2")
        if ao_debug then
            log("Atomic Overhaul: Krastorio 2 detected, loading compatibility script")
        end
    end
    -- if name == "ruins" then -- not ready yet
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
