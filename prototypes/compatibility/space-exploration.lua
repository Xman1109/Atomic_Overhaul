if settings.startup["se-addon"].value == true then
    table.insert(data.raw["technology"]["se-antimatter-reactor"].prerequisites, "space-reactor")
    data.raw["reactor"]["nuclear-reactor"].collision_mask =
    data.raw["transport-belt"]["transport-belt"].collision_mask or
        data.raw["assembling-machine"]["assembling-machine-1"].collision_mask
    data.raw["tool"]["research-data"].order = "zz"
    -- data.raw["recipe"]["research-data-recipe"].order = "zz"
    regroup("r", "research-data-recipe", nil, nil, "zz")
    -- data.raw["item"]["nuclear-fuel"].order = "a"
    -- data.raw["item"]["nuclear-fuel"].group = "atomic-overhaul"
    -- data.raw["item"]["nuclear-fuel"].subgroup = "fuel"
    regroup("i", "nuclear-fuel", "AO", "fuel", "a")
    -- data.raw["recipe"]["nuclear-fuel-reprocessing"].results = {{
    --     type = "item",
    --     name = "plutonium",
    --     amount_min = 1,
    --     amount_max = 3
    -- }, {
    --     type = "item",
    --     name = "uranium-238",
    --     amount = 3
    -- }, {
    --     type = "item",
    --     name = "nuclear-waste",
    --     amount = 5
    -- }, {
    --     type = "item",
    --     name = "research-data",
    --     amount_min = 1,
    --     amount_max = 3
    -- }}
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

        -- data.raw["recipe"]["uranium-processing"].order = "b"
        -- data.raw["recipe"]["uranium-processing"].group = "atomic-overhaul"
        -- data.raw["recipe"]["uranium-processing"].subgroup = "resources"
        regroup("r", "uranium-processing", "AO", "resources", "b")

        -- data.raw["item"]["uranium-235"].order = "c"
        -- data.raw["item"]["uranium-235"].group = "atomic-overhaul"
        -- data.raw["item"]["uranium-235"].subgroup = "resources"
        regroup("i", "uranium-235", "AO", "resources", "c")

        -- data.raw["item"]["uranium-238"].order = "b"
        -- data.raw["item"]["uranium-238"].group = "atomic-overhaul"
        -- data.raw["item"]["uranium-238"].subgroup = "resources"
        regroup("i", "uranium-238", "AO", "resources", "b")

        -- data.raw["item"]["uranium-fuel-cell"].order = "b"
        -- data.raw["item"]["uranium-fuel-cell"].group = "atomic-overhaul"
        -- data.raw["item"]["uranium-fuel-cell"].subgroup = "fuel-cells"
        regroup("i", "uranium-fuel-cell", "AO", "fuel-cells", "b")

        -- data.raw["item"]["used-up-uranium-fuel-cell"].order = "b"
        -- data.raw["item"]["used-up-uranium-fuel-cell"].group = "atomic-overhaul"
        -- data.raw["item"]["used-up-uranium-fuel-cell"].subgroup = "used-up-fuel-cells"
        regroup("i", "used-up-uranium-fuel-cell", "AO", "used-up-fuel-cells", "b")

        -- data.raw["recipe"]["uranium-fuel-cell"].order = "b"
        -- data.raw["recipe"]["uranium-fuel-cell"].group = "atomic-overhaul"
        -- data.raw["recipe"]["uranium-fuel-cell"].subgroup = "fuel-cells"
        regroup("r", "uranium-fuel-cell", "AO", "fuel-cells", "b")

        -- data.raw["recipe"]["nuclear-fuel-reprocessing"].order = "b"
        -- data.raw["recipe"]["nuclear-fuel-reprocessing"].group = "atomic-overhaul"
        -- data.raw["recipe"]["nuclear-fuel-reprocessing"].subgroup = "reprocessing"
        regroup("r", "nuclear-fuel-reprocessing", "AO", "reprocessing", "b")

        -- data.raw["recipe"]["nuclear-fuel"].order = "a"
        -- data.raw["recipe"]["nuclear-fuel"].group = "atomic-overhaul"
        -- data.raw["recipe"]["nuclear-fuel"].subgroup = "fuel"
        regroup("r", "nuclear-fuel", "AO", "fuel", "a")

        -- data.raw["technology"]["se-centrifuge"].hidden = true
        hideType("t", "se-centrifuge")

        -- if not data.raw["item-subgroup"]["fuel"] then
        --    data:extend({{
        --        type = "item-subgroup",
        --        name = "fuel",
        --        group = "resources",
        --        order = "d"
        --    }})
        -- end
        -- getDefaultOf("r", "iron-gear-wheel")
        -- should work, but doesnt
        -- data.raw["recipe"]["fuel-processing"].order = "a"
        -- data.raw["recipe"]["fuel-processing"].group = "intermediate-products"
        -- data.raw["recipe"]["fuel-processing"].subgroup = "fuel"
        regroup("r", "fuel-processing", "intermediate-products", "fuel", "a")
        -- loadDefaultOf("r", "fuel-processing")
        -- loadDefaultOf("r", "iron-gear-wheel")

        -- data.raw["recipe"]["se-processed-fuel-from-solid-fuel"].order = "a"
        -- data.raw["recipe"]["se-processed-fuel-from-solid-fuel"].group = "intermediate-products"
        -- data.raw["recipe"]["se-processed-fuel-from-solid-fuel"].subgroup = "fuel"
        regroup("r", "se-processed-fuel-from-solid-fuel", "intermediate-products", "fuel", "a")

        -- data.raw["recipe"]["rocket-fuel"].order = "p"
        -- data.raw["recipe"]["rocket-fuel"].group = "intermediate-products"
        -- data.raw["recipe"]["rocket-fuel"].subgroup = "fuel"
        regroup("r", "rocket-fuel", "intermediate-products", "fuel", "p")

        -- data.raw["recipe"]["se-liquid-rocket-fuel"].order = "p"
        -- data.raw["recipe"]["se-liquid-rocket-fuel"].group = "intermediate-products"
        -- data.raw["recipe"]["se-liquid-rocket-fuel"].subgroup = "fuel"
        regroup("r", "se-liquid-rocket-fuel", "intermediate-products", "fuel", "p")

        -- data.raw["recipe"]["se-rocket-fuel-from-water-copper"].order = "p"
        -- data.raw["recipe"]["se-rocket-fuel-from-water-copper"].group = "intermediate-products"
        -- data.raw["recipe"]["se-rocket-fuel-from-water-copper"].subgroup = "fuel"

        -- data.raw["recipe"]["se-vulcanite-rocket-fuel"].order = "p"
        -- data.raw["recipe"]["se-vulcanite-rocket-fuel"].group = "intermediate-products"
        -- data.raw["recipe"]["se-vulcanite-rocket-fuel"].subgroup = "fuel"
        regroup("r", "se-vulcanite-rocket-fuel", "intermediate-products", "fuel", "p")

        -- data.raw["recipe"]["solid-fuel-from-light-oil"].order = "b[fluid-chemistry]-c[solid-fuel-from-light-oil]"
        -- data.raw["recipe"]["solid-fuel-from-light-oil"].group = "resources"
        -- data.raw["recipe"]["solid-fuel-from-light-oil"].subgroup = "fuel"
        regroup("r", "solid-fuel-from-light-oil", "resources", "fuel", "b[fluid-chemistry]-c[solid-fuel-from-light-oil]")

        -- data.raw["recipe"]["solid-fuel-from-petroleum-gas"].order =
        --     "b[fluid-chemistry]-d[solid-fuel-from-petroleum-gas]"
        -- data.raw["recipe"]["solid-fuel-from-petroleum-gas"].group = "resources"
        -- data.raw["recipe"]["solid-fuel-from-petroleum-gas"].group = "fuel"
        regroup("r", "solid-fuel-from-petroleum-gas", "resources", "fuel",
            "b[fluid-chemistry]-d[solid-fuel-from-petroleum-gas]")

        -- data.raw["recipe"]["solid-fuel-from-heavy-oil"].order = "b[fluid-chemistry]-e[solid-fuel-from-heavy-oil]"
        -- data.raw["recipe"]["solid-fuel-from-heavy-oil"].group = "resources"
        -- data.raw["recipe"]["solid-fuel-from-heavy-oil"].group = "fuel"
        regroup("r", "solid-fuel-from-heavy-oil", "resources", "fuel", "b[fluid-chemistry]-e[solid-fuel-from-heavy-oil]")
    end
end
