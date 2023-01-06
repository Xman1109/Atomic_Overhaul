-- checking if the mod is loaded on a used savegame for the first time
script.on_init(function()
    game.print(
        "\nNOTE: If Atomic Overhaul has been added to an already existing savegame, you may need to troubleshoot your nuclear processing.\n")
end)

script.on_configuration_changed(function()
    game.print(
        "\nAtomic Overhaul now features a new way of creating Graphite.\nIf you dont like it, you can disable it in the mod settings.\n")
end)



--- script stage ---
local k2 = require("scripts.krastorio2")
local informatron = require("scripts.informatron")
if ruins then
    local ruins = require("scripts.ruins-mod")
end
