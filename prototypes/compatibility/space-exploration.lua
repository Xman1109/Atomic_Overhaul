if settings.startup["se-addon"].value == true then
    table.insert(data.raw["technology"]["se-antimatter-reactor"].prerequisites, "space-reactor")
    data.raw["reactor"]["nuclear-reactor"].collision_mask =
    data.raw["transport-belt"]["transport-belt"].collision_mask or
        data.raw["assembling-machine"]["assembling-machine-1"].collision_mask
    data.raw["tool"]["research-data"].order = "zz"
    regroup("r", "research-data-recipe", nil, nil, "zz")
    regroup("i", "nuclear-fuel", "AO", "fuel", "a")
    modifyResults("nuclear-fuel-reprocessing", { {
        type = "item",
        name = "plutonium",
        amount_min = 1,
        amount_max = 3
    }, {
        type = "item",
        name = "uranium-238",
        amount = 3
    }, {
        type = "item",
        name = "nuclear-waste",
        amount = 5
    }, {
        type = "item",
        name = "research-data",
        amount_min = 1,
        amount_max = 3
    } })

    if data.raw["recipe"]["se-vulcanite-enriched"] or data.raw["recipe"]["se-casting-machine"] then
        modifyPrerequisites("uranium-processing", { "graphite-fuel-reprocessing", "advanced-electronics-2" })
        regroup("r", "uranium-processing", "AO", "resources", "b")
        regroup("i", "uranium-235", "AO", "resources", "c")
        regroup("i", "uranium-238", "AO", "resources", "b")
        regroup("i", "uranium-fuel-cell", "AO", "fuel-cells", "b")
        regroup("i", "used-up-uranium-fuel-cell", "AO", "used-up-fuel-cells", "b")
        regroup("r", "uranium-fuel-cell", "AO", "fuel-cells", "b")
        regroup("r", "nuclear-fuel-reprocessing", "AO", "reprocessing", "b")
        regroup("r", "nuclear-fuel", "AO", "fuel", "a")
        hideType("t", "se-centrifuge")
        regroup("r", "fuel-processing", "intermediate-products", "fuel", "a")
        regroup("r", "se-processed-fuel-from-solid-fuel", "intermediate-products", "fuel", "a")
        regroup("r", "rocket-fuel", "intermediate-products", "fuel", "p")
        regroup("r", "se-liquid-rocket-fuel", "intermediate-products", "fuel", "p")
        regroup("r", "se-vulcanite-rocket-fuel", "intermediate-products", "fuel", "p")
        regroup("r", "solid-fuel-from-light-oil", "resources", "fuel", "b[fluid-chemistry]-c[solid-fuel-from-light-oil]")
        regroup("r", "solid-fuel-from-petroleum-gas", "resources", "fuel",
            "b[fluid-chemistry]-d[solid-fuel-from-petroleum-gas]")
        regroup("r", "solid-fuel-from-heavy-oil", "resources", "fuel", "b[fluid-chemistry]-e[solid-fuel-from-heavy-oil]")
    end
end
