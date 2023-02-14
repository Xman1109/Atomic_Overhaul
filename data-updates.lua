if not mods["Krastorio2"] then
    require(vanilla .. "atomic-bomb")
else
    if ao_debug then
        log("Atomic Overhaul: Atomic Bomb not changed, because of Krastorio2")
    end
end
require(vanilla .. "icons")
require(vanilla .. "items")
require(vanilla .. "recipes")
require(vanilla .. "technologies")
require(vanilla .. "entities")

if mods["space-exploration"] and settings.startup["se-addon"].value == true then
    require("__Atomic_Overhaul__/lib/se-addon")
    require(se_addon_entities .. "space-reactor")
end
