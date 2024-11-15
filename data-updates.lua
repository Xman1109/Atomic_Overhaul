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
    if settings.startup["ao-complexity-level"].value == "simple" then
        if ao_debug then
            log("Atomic Overhaul: Space Exploration add-on is ignored because of simplified complexity level selected.")
        end
    else
        require("__Atomic_Overhaul__/lib/se-addon")
        require(se_addon_entities .. "space-reactor")
    end
end
