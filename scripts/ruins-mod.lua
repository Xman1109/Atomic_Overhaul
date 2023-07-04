-- local small_ruins = require("__Atomic_Overhaul__.prototypes.addons.the-ruins-mod.ruins-set.ruins.small")
require("lib.ruins-addon")

local medium_ruins = { require(ruins_addon_medium .. "1"), require(ruins_addon_medium .. "2"),
    require(ruins_addon_medium .. "3"), require(ruins_addon_medium .. "4") }
log(serpent.block(medium_ruins))
local large_ruins = require(ruins_addon_large .. "5")

local function make_ruin_set()
    -- Get the base ruin set of the AbandonedRuins mod. This creates a copy of that ruin set.
    local base_ruins = remote.call("AbandonedRuins", "get_ruin_set", "base")

    -- Add the custom AO ruins to the existing ruins.
    for _, ruin in pairs(medium_ruins) do
        table.insert(base_ruins.medium, ruin)
    end

    table.insert(base_ruins.large, large_ruins)

    -- Add the custom ruin set to the AbandonedRuins mod.
    remote.call("AbandonedRuins", "add_ruin_set", "Atomic_Overhaul", base_ruins.small, base_ruins.medium, base_ruins.large)
end

script.on_init(make_ruin_set)
script.on_load(make_ruin_set)


-- local documents = {}

-- function documents.on_player_used_capsule(event)
--     if event.item == "ancient-documents" then
--         local techs = {}
--         local r = math.random(1, #techs)
--         while game.forces.player.technologies[techs[r]].hidden == false do
--             r = math.random(1, #techs)
--         end
--         game.forces.player.technologies[techs[r]].hidden = false
--     end
-- end
