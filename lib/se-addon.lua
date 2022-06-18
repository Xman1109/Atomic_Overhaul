se_addon_graphics = "__Atomic_Overhaul__/graphics/se-addon/icons/"
se_addon_items = "__Atomic_Overhaul__.prototypes.addons.space-exploration.items."
se_addon_recipes = "__Atomic_Overhaul__.prototypes.addons.space-exploration.recipes."
se_addon_techs = "__Atomic_Overhaul__.prototypes.addons.space-exploration.technologies."
se_addon_entities = "__Atomic_Overhaul__.prototypes.addons.space-exploration.entities."

hit_effects = require("__base__.prototypes.entity.hit-effects")
sounds = require("__base__.prototypes.entity.sounds")

debug_addon_text = "AO-DEBUG: Add-on loaded for: "


fuel_cell = settings.startup["fuel-cell-ingredient"].value
if fuel_cell == "Advanced Fuel Cell" then
    fuel_cell = "advanced-fuel-cell"
elseif fuel_cell == "Normal Fuel Cell" then
    fuel_cell = "empty-fuel-cell"
else
    if ao_debug then
        log("Atomic Overhaul: [SE Addon] [Fuel Cell] Invalid fuel cell ingredient: " .. fuel_cell)
    end
    fuel_cell = settings.startup["fuel-cell-ingredient"].default_value
end
