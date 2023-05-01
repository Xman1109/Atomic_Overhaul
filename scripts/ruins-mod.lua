-- local small_ruins = require("__Atomic_Overhaul__.prototypes.addons.the-ruins-mod.ruins-set.ruins.small")
local medium_ruins = require("__Atomic_Overhaul__.prototypes.addons.the-ruins-mod.ruins-set.ruins.medium")
local large_ruins = require("__Atomic_Overhaul__.prototypes.addons.the-ruins-mod.ruins-set.ruins.large")

local function make_ruin_set()
    remote.call("AbandonedRuins", "add_ruin_set", "Atomic_Overhaul", small_ruins, medium_ruins, large_ruins)
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
