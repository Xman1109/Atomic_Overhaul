require(vanilla .. "atomic-bomb")
require(vanilla .. "icons")
require(vanilla .. "items")
require(vanilla .. "recipes")
require(vanilla .. "technologies")

--Addon stage begins here.
if mods["space-exploration"] and settings.startup["se-addon"].value == true then
    require("__Atomic_Overhaul__/lib/se-addon")
        require("prototypes.addons.space-exploration.group")
        require(se_addon_items .. "advanced-fuel-cell")
        require(se_addon_items .. "beryllium-7")
        require(se_addon_items .. "holmium-166")
        require(se_addon_items .. "iridium-192")
        require(se_addon_items .. "iridium-fuel-cell")
        require(se_addon_items .. "iridium-depleted-cell")
        require(se_addon_items .. "holmium-fuel-cell")
        require(se_addon_items .. "holmium-depleted-cell")
        require(se_addon_items .. "beryllium-fuel-cell")
        require(se_addon_items .. "beryllium-depleted-cell")
        require(se_addon_items .. "space-reactor")

        require(se_addon_recipes .. "advanced-fuel-cell-recipe")
        require(se_addon_recipes .. "iridium-fuel-cell-recipe")
        require(se_addon_recipes .. "holmium-fuel-cell-recipe")
        require(se_addon_recipes .. "beryllium-fuel-cell-recipe")
        require(se_addon_recipes .. "iridium-192-recipe")
        require(se_addon_recipes .. "holmium-166-recipe")
        require(se_addon_recipes .. "beryllium-7-recipe")
        require(se_addon_recipes .. "iridium-192-reprocessing-recipe")
        require(se_addon_recipes .. "holmium-166-reprocessing-recipe")
        require(se_addon_recipes .. "beryllium-7-reprocessing-recipe")
        require(se_addon_recipes .. "iridium-192-without-research-data-recipe")
        require(se_addon_recipes .. "holmium-166-without-research-data-recipe")
        require(se_addon_recipes .. "beryllium-7-without-research-data-recipe")

        require(se_addon_techs .. "iridium-192-processing")
        require(se_addon_techs .. "holmium-166-processing")
        require(se_addon_techs .. "beryllium-7-processing")
        require(se_addon_techs .. "iridium-192-reprocessing")
        require(se_addon_techs .. "holmium-166-reprocessing")
        require(se_addon_techs .. "beryllium-7-reprocessing")
        require(se_addon_techs .. "iridium-192-without-research-data")
        require(se_addon_techs .. "holmium-166-without-research-data")
        require(se_addon_techs .. "beryllium-7-without-research-data")
        --if not mods["RealisticReactors"] then
        require(se_addon_entities .."space-reactor")
        --else
        --require(se_addon_entities .."space-reactor-rr")
        --end
        if ao_debug == true then
            log(debug_addon_text .. "space-exploration")
        end
end