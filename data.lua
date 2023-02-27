require("__Atomic_Overhaul__/lib/core")

require("prototypes/group") --s
require(fluids .. "waste-solution") --s
require(items .. "empty-fuel-cell") --s
require(items .. "nuclear-waste") --s
require(items .. "research-data") --s
require(items .. "uranium-fuel-rod") --s
require(items .. "graphite") --s
require(items .. "graphite-depleted-cell") --s
require(items .. "graphite-fuel-cell") --s
require(items .. "MOX") --s
require(items .. "MOX-depleted-cell") --s CHECK FOR COLOR if very different color is required
require(items .. "MOX-fuel-cell") --s CHECK FOR COLOR if very different color is required
require(items .. "MOX-fuel-rod") --s
require(items .. "plutonium") --s CHECK FOR COLOR if very different color is required
require(items .. "plutonium-depleted-cell") --s
require(items .. "plutonium-fuel") --s
require(items .. "plutonium-fuel-cell") --s
require(items .. "plutonium-fuel-rod") --s
require(items .. "thorium") --s
require(items .. "thorium-depleted-cell") --s
require(items .. "thorium-fuel-cell") --s
require(items .. "thorium-fuel-rod") --s
require(items .. "thorium-module-1") --s
require(items .. "thorium-module-2") --s
require(items .. "thorium-module-3") --s


require(ao_recipes .. "empty-fuel-cell-recipe") --s
require(ao_recipes .. "graphite-fuel-cell-recipe") --s
require(ao_recipes .. "graphite-fuel-cell-recipe") -- ?? graphite-furnace-recipe ?
require(ao_recipes .. "graphite-fuel-reprocessing") --s
require(ao_recipes .. "graphite-recipe") --s
require(ao_recipes .. "MOX-fuel-cell-recipe") --s
require(ao_recipes .. "MOX-fuel-reprocessing") --s
require(ao_recipes .. "MOX-recipe") --s
require(ao_recipes .. "MOX-without-research-data") --s
require(ao_recipes .. "plutonium-fuel-cell-recipe") --s
require(ao_recipes .. "plutonium-fuel-recipe") --s
require(ao_recipes .. "plutonium-fuel-reprocessing") --s
require(ao_recipes .. "plutonium-without-research-data") --s
require(ao_recipes .. "research-data") --s
require(ao_recipes .. "thorium-fuel-cell-recipe") --s
require(ao_recipes .. "thorium-fuel-reprocessing") --s
require(ao_recipes .. "thorium-module-1") --s
require(ao_recipes .. "thorium-module-2") --s
require(ao_recipes .. "thorium-module-3") --s
require(ao_recipes .. "thorium-recipe") --s
require(ao_recipes .. "uranium-without-research-data") --s
require(ao_recipes .. "waste-liquefaction") --s
require(ao_recipes .. "waste-solution-reprocessing") --s


require(techs .. "graphite-fuel-reprocessing") --s
require(techs .. "graphite-processing") --s
require(techs .. "plutonium-fuel-reprocessing") --s
require(techs .. "plutonium-fuel") --s
require(techs .. "plutonium-processing") --s
require(techs .. "plutonium-without-research-data") --s
require(techs .. "MOX-fuel-reprocessing") --s
require(techs .. "MOX-processing") --s
require(techs .. "MOX-without-research-data") --s
require(techs .. "thorium-fuel-reprocessing") --s
require(techs .. "thorium-module-1") --s
require(techs .. "thorium-module-2") --s
require(techs .. "thorium-module-3") --s
require(techs .. "thorium-processing") --s
require(techs .. "uranium-without-research-data") --s
require(techs .. "waste-reprocessing") --s

if settings.startup["old-graphite-fuel"].value == false then
    require(items .. "non-moderated-fuel-cell") --s
    require(items .. "non-moderated-depleted-cell") --s
    require(items .. "heat-furnace")
    require(ao_recipes .. "non-moderated-fuel-cell-recipe") --s
    require(ao_recipes .. "non-moderated-fuel-reprocessing") --s
    require(ao_recipes .. "graphite-furnace-recipe") --s
    require(ao_recipes .. "heat-furnace-recipe")
    require(techs .. "non-moderated-fuel-processing") --s
    require(techs .. "non-moderated-fuel-reprocessing") --s
    require(techs .. "graphite-cooking") --s
    require(entities .. "heat-furnace")
end

if settings.startup["thorium-wrd"].value == true then
    require(ao_recipes .. "thorium-without-research-data") --s
    require(techs .. "thorium-without-research-data") --s
end

if mods["informatron"] then
    -- style_name, filename, width, height -- style_name MUST be a completely unique name
    informatron_make_image("header", images .. "logo.png", 800, 250)
    informatron_make_image("graphite", images .. "graphite.png", 64, 64)
    informatron_make_image("uranium", images .. "uranium.png", 64, 64)
    informatron_make_image("plutonium", images .. "plutonium.png", 64, 64)
    informatron_make_image("MOX", images .. "MOX.png", 64, 64)
    informatron_make_image("thorium", images .. "thorium.png", 64, 64)
    informatron_make_image("Space_Reactor", images .. "Space_Reactor.png", 302, 318)
    informatron_make_image("iridium", images .. "iridium.png", 64, 64)
    informatron_make_image("holmium", images .. "holmium.png", 64, 64)
    informatron_make_image("beryllium", images .. "beryllium.png", 64, 64)
    informatron_make_image("glow_1", images .. "glow.png", 243, 100)
end

-- TODO: make the scripts "beautiful"
-- TODO: add the fuel rods ✔ (space rods still missing)
-- TODO: Fix the icons with the zero g icon ✔
-- TODO: Add locals ✔ (recipes still need locales)
-- TODO: Make recipes for the fuel rods
-- TODO: Add the rod-light map to the fuel rods
