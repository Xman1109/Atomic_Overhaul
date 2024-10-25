if settings.startup["ao-complexity-level"].value == "simple" then
    data.raw["technology"]["nuclear-fuel-reprocessing"].localised_description = {
        "technology-description.nuclear-fuel-reprocessing-simple" }
elseif settings.startup["ao-complexity-level"].value ~= "simple" then
    for _, lab in pairs(data.raw["lab"]) do
        if lab.inputs then
            table.insert(lab.inputs, "research-data")
        end
    end
    -- TODO: instead of table.insert, use our own functions
    table.insert(data.raw["technology"]["nuclear-fuel-reprocessing"].prerequisites, "uranium-processing")
    table.insert(data.raw["technology"]["atomic-bomb"].prerequisites, "plutonium-processing")
    table.insert(data.raw["technology"]["atomic-bomb"].unit.ingredients, { "research-data", 1 })
    table.insert(data.raw["technology"]["nuclear-fuel-reprocessing"].effects,
        { type = "unlock-recipe", recipe = "research-data-recipe" })

    modifyEffects("nuclear-power", {
        {
            type = "unlock-recipe",
            recipe = "nuclear-reactor"
        },
        {
            type = "unlock-recipe",
            recipe = "heat-exchanger"
        },
        {
            type = "unlock-recipe",
            recipe = "heat-pipe"
        },
        {
            type = "unlock-recipe",
            recipe = "steam-turbine"
        }
    })

    if settings.startup["old-graphite-fuel"].value then
        data.raw["technology"]["uranium-processing"].prerequisites = { "graphite-fuel-reprocessing" }
        data.raw["technology"]["nuclear-power"].prerequisites = { "ao-graphite-processing" }
        data.raw["technology"]["uranium-processing"].effects = {
            { type = "unlock-recipe", recipe = "uranium-processing" },
            { type = "unlock-recipe", recipe = "uranium-fuel-cell" } }
        addResearchData({ "uranium-processing", "nuclear-fuel-reprocessing", "kovarex-enrichment-process", "uranium-ammo" })
    else
        data.raw["technology"]["uranium-processing"].prerequisites = { "graphite-cooking" }
        data.raw["technology"]["nuclear-power"].prerequisites = { "non-moderated-fuel-processing" }
        modifyEffects("uranium-processing",
            { { type = "unlock-recipe", recipe = "uranium-fuel-cell" },
                { type = "unlock-recipe", recipe = "uranium-rod-recipe" } })
    end
end
