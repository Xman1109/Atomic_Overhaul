ao_debug = settings.startup["ao-debug"].value
log("Atomic_Overhaul-Debug = " .. tostring(ao_debug))

require(compatibility .. "other-small-mods")
if mods["bobplates"] then
    require(compatibility .. "bobplates")
    bobplates = true
    if ao_debug == true then
        log(debug_text .. "bobplates")
    end
end
if mods["Clowns-Nuclear"] then
    if mods["Clowns-AngelBob-Nuclear"] then
        require(compatibility .. "madclown-angelbob")
        if ao_debug == true then
            log(debug_text .. "Clowns-AngelBob-Nuclear")
        end
    else
        require(compatibility .. "clowns-vanilla-nuclear")
        if ao_debug == true then
            log(debug_text .. "Clowns-Nuclear")
        end
    end
end
if mods["Nuclear Fuel"] then
    require(compatibility .. "nuclear-fuel")
    if ao_debug == true then
        log(debug_text .. "Nuclear Fuel")
    end
end
if mods["angelspetrochem"] then
    require(compatibility .. "angels-petrochem")
    if ao_debug == true then
        log(debug_text .. "angelspetrochem")
    end
end
if mods["Krastorio2"] then
    if mods["space-exploration"] then
        require(compatibility .. "k2-se")
        k2_se = true
        if ao_debug == true then
            log(debug_text .. "Krastorio2+Space Exploration")
        end
    else
        require(compatibility .. "krastorio2")
        K2 = true
        if ao_debug == true then
            log(debug_text .. "Krastorio2")
        end
    end
elseif mods["space-exploration"] then
    require(compatibility .. "space-exploration")
    se = true
    if ao_debug == true then
        log(debug_text .. "space-exploration")
    end
end

if mods["bzcarbon"] then
    require(compatibility .. "bzcarbon")
    bzcarbon = true
    if ao_debug == true then
        log(debug_text .. "bzcarbon")
    end
end

if mods["bzlead"] or mods["bzzirconium"] then
    require(compatibility .. "bznuclear")
    if ao_debug == true then
        log(debug_text .. "bzlead and/or bzzirconium")
    end
end

-- Addon stage begins here.
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
    require(se_addon_items .. "lead-delivery-capsule")
    require(se_addon_items .. "capsule-items")
    require(se_addon_items .. "advanced-MOX-fuel-cell")
    require(se_addon_items .. "advanced-MOX-depleted-cell")

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
    require(se_addon_recipes .. "space-reactor-recipe")
    require(se_addon_recipes .. "lead-delivery-recipe")
    require(se_addon_recipes .. "capsule-recipes")

    require(se_addon_techs .. "iridium-192-processing")
    require(se_addon_techs .. "holmium-166-processing")
    require(se_addon_techs .. "beryllium-7-processing")
    require(se_addon_techs .. "iridium-192-reprocessing")
    require(se_addon_techs .. "holmium-166-reprocessing")
    require(se_addon_techs .. "beryllium-7-reprocessing")
    require(se_addon_techs .. "iridium-192-without-research-data")
    require(se_addon_techs .. "holmium-166-without-research-data")
    require(se_addon_techs .. "beryllium-7-without-research-data")
    require(se_addon_techs .. "space-reactor")

    if ao_debug == true then
        log(debug_addon_text .. "space-exploration")
    end
end

-- if mods["AbandonedRuins"] and settings.startup["ruins-addon"].value == true then
--     require("__Atomic_Overhaul__.prototypes.addons.the-ruins-mod.ruin-set")
--     ruins = true
--     if ao_debug == true then
--         log(debug_text .. "the-ruins-mod")
--     end
-- end


if settings.startup["old-graphite-fuel"].value == false then
    if settings.startup["heat-algo-mode"].value ~= "off" then
        require(ao_recipes .. "plate-heat-recipe")
    end
end
