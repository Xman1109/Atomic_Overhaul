require(vanilla .. "atomic-bomb")
require(vanilla .. "icons")
require(vanilla .. "items")
require(vanilla .. "recipes")
require(vanilla .. "technologies")
require(vanilla .. "entities")

if mods["space-exploration"] and settings.startup["se-addon"].value == true then
    require("__Atomic_Overhaul__/lib/se-addon")
    require(se_addon_entities .. "space-reactor")
end
