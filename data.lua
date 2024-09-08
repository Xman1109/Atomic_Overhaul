require("__Atomic_Overhaul__/lib/core")

ao_breeder = (not mods["Nuclear Fuel"]) and settings.startup["ao-complexity-level"].value == "simple"
    and settings.startup["ao-breeder"].value
ao_enrichUranium = (not mods["SchallUraniumProcessing"]) and settings.startup["ao-complexity-level"].value == "simple"
local breed = require("prototypes/breeder")
if ao_enrichUranium then -- if no SchallUraniumProcessing is loaded we always add our own (better) enrichment levels for simplified mod complexity
    breed.NewEnrichment()
end
if ao_breeder then -- Breeder is added optionally, but it conflicts with Nuclear Fuel (as I found NF support in this mod)
    -- Breeder requires (must have!) uranium enrichment recipes added by AO or by SchallUraniumProcessing !!!
    breed.Breeder()
end

require("prototypes/group")
require(fluids .. "waste-solution")
require(fluids .. "heating-oil")
require(items .. "empty-fuel-cell")
require(items .. "nuclear-waste")
require(items .. "research-data")
require(items .. "graphite")
require(items .. "graphite-depleted-cell")
require(items .. "graphite-fuel-cell")
require(items .. "heat-fluid-tank")
require(items .. "heat-tank-pipe")
require(items .. "MOX")
require(items .. "MOX-depleted-cell")
require(items .. "MOX-fuel-cell")
require(items .. "MOX-fuel-rod")
require(items .. "plutonium")
require(items .. "plutonium-depleted-cell")
require(items .. "plutonium-fuel")
require(items .. "plutonium-fuel-cell")
require(items .. "plutonium-fuel-rod")
require(items .. "thorium")
require(items .. "thorium-depleted-cell")
require(items .. "thorium-fuel-cell")
require(items .. "thorium-fuel-rod")
require(items .. "thorium-module-1")
require(items .. "thorium-module-2")
require(items .. "thorium-module-3")
require(items .. "uranium-fuel-rod")

require(items .. "isotope-scrap")


require(ao_recipes .. "empty-fuel-cell-recipe")
require(ao_recipes .. "graphite-fuel-cell-recipe")
require(ao_recipes .. "graphite-fuel-reprocessing")
require(ao_recipes .. "graphite-recipe")
require(ao_recipes .. "heat-fluid-tank-recipe")
require(ao_recipes .. "heating-oil-recipe")
require(ao_recipes .. "MOX-fuel-cell-recipe")
require(ao_recipes .. "MOX-fuel-reprocessing")
require(ao_recipes .. "MOX-recipe")
require(ao_recipes .. "MOX-rod-recipe")
require(ao_recipes .. "MOX-without-research-data")
require(ao_recipes .. "plutonium-fuel-cell-recipe")
require(ao_recipes .. "plutonium-fuel-recipe")
require(ao_recipes .. "plutonium-fuel-reprocessing")
require(ao_recipes .. "plutonium-without-research-data")
require(ao_recipes .. "plutonium-rod-recipe")
require(ao_recipes .. "research-data")
require(ao_recipes .. "thorium-fuel-cell-recipe")
require(ao_recipes .. "thorium-fuel-reprocessing")
require(ao_recipes .. "thorium-module-1")
require(ao_recipes .. "thorium-module-2")
require(ao_recipes .. "thorium-module-3")
require(ao_recipes .. "thorium-recipe")
require(ao_recipes .. "thorium-rod-recipe")
require(ao_recipes .. "uranium-rod-recipe")
require(ao_recipes .. "uranium-without-research-data")
require(ao_recipes .. "waste-liquefaction")
require(ao_recipes .. "waste-solution-reprocessing")
if settings.startup["ao-complexity-level"].value == "simple" then
    for _, i in pairs(data.raw["module"]) do
    if i.category == "productivity" then
      table.insert(i.limitation, "MOX-fuel-cell-recipe")
      table.insert(i.limitation, "MOX-reprocessing")
    end
  end
end

require(techs .. "graphite-fuel-reprocessing")
require(techs .. "graphite-processing")
require(techs .. "heating-oil")
require(techs .. "plutonium-fuel-reprocessing")
require(techs .. "plutonium-fuel")
require(techs .. "plutonium-processing")
require(techs .. "plutonium-without-research-data")
require(techs .. "MOX-fuel-reprocessing")
require(techs .. "MOX-processing")
require(techs .. "MOX-without-research-data")
require(techs .. "thorium-fuel-reprocessing")
require(techs .. "thorium-module-1")
require(techs .. "thorium-module-2")
require(techs .. "thorium-module-3")
require(techs .. "thorium-processing")
require(techs .. "uranium-without-research-data")
require(techs .. "waste-reprocessing")

require(entities .. "heat-fluid-tank")
require(entities .. "heat-tank-pipe")

if settings.startup["old-graphite-fuel"].value == false then
    require(items .. "non-moderated-fuel-cell")
    require(items .. "non-moderated-depleted-cell")
    require(items .. "heat-furnace")
    require(ao_recipes .. "non-moderated-fuel-cell-recipe")
    require(ao_recipes .. "non-moderated-fuel-reprocessing")
    require(ao_recipes .. "graphite-furnace-recipe")
    require(ao_recipes .. "heat-furnace-recipe")
    require(techs .. "non-moderated-fuel-processing")
    require(techs .. "non-moderated-fuel-reprocessing")
    require(techs .. "graphite-cooking")
    require(entities .. "heat-furnace")
end

if settings.startup["thorium-wrd"].value == true then
    require(ao_recipes .. "thorium-without-research-data")
    require(techs .. "thorium-without-research-data")
end

if mods["informatron"] then
    -- style_name, filename, width, height -- style_name MUST be a completely unique name
    informatron_make_image("header", images .. "logo.png", 800, 250)
    informatron_make_image("graphite", images .. "graphite.png", 64, 64)
    informatron_make_image("uranium", images .. "uranium.png", 64, 64)
    informatron_make_image("plutonium", images .. "plutonium.png", 64, 64)
    informatron_make_image("MOX", images .. "MOX.png", 64, 64)
    informatron_make_image("thorium", images .. "thorium.png", 64, 64)
    informatron_make_image("Space_Reactor", images .. "hr-reactor.png", 302, 318)
    informatron_make_image("iridium", images .. "iridium.png", 64, 64)
    informatron_make_image("holmium", images .. "holmium.png", 64, 64)
    informatron_make_image("beryllium", images .. "beryllium.png", 64, 64)
    informatron_make_image("glow_1", images .. "glow.png", 243, 100)
end
