data.raw["recipe"]["atomic-bomb"].icon = "__Krastorio2Assets__/icons/ammo/atomic-bomb.png"
data.raw["recipe"]["atomic-bomb"].icon_size = 64
data.raw["recipe"]["atomic-bomb"].icon_mipmaps = 4
modifyPrerequisites("nuclear-fuel-reprocessing", "uranium-processing", "add")
modifyResults("uranium-without-research-data", { {
    type = "item",
    name = "uranium-238",
    amount = 6
}, {
    type = "item",
    name = "plutonium",
    amount_min = 2,
    amount_max = 4
}, {
    type = "item",
    name = "nuclear-waste",
    amount = 5
}, {
    type = "item",
    name = "tritium",
    probability = 0.20,
    amount = 1
}, {
    type = "item",
    name = "stone",
    amount = 4
} })
modifyEffects("nuclear-fuel-reprocessing", { {
    type = "unlock-recipe",
    recipe = "ao-nuclear-fuel-reprocessing"
} })
hideType("r", "nuclear-fuel-reprocessing")
local nfr = table.deepcopy(data.raw["recipe"]["nuclear-fuel-reprocessing"])
nfr.name = "ao-nuclear-fuel-reprocessing"
nfr.enabled = false
nfr.hidden = false
nfr.subgroup = "reprocessing"
nfr.order = "b"
nfr.localized_name = { "recipe-name.ao-nuclear-fuel-reprocessing" }
nfr.results = { {
    type = "item",
    name = "uranium-238",
    amount = 5
}, {
    type = "item",
    name = "stone",
    amount = 3
}, {
    type = "item",
    name = "tritium",
    probability = 0.15,
    amount = 1
}, {
    type = "item",
    name = "plutonium",
    amount_min = 1,
    amount_max = 3
}, {
    type = "item",
    name = "nuclear-waste",
    amount = 5
}, {
    type = "item",
    name = "research-data",
    amount_min = 1,
    amount_max = 3
} }
data:extend({ nfr })
if not mods["RealisticFusionPower"] then
    k2_se_list = { "kr-antimatter-ammo", "kovarex-enrichment-process", "kr-fusion-energy", "kr-antimatter-reactor",
        "kr-antimatter-reactor-equipment", "fusion-reactor-equipment", "spidertron", "kr-rocket-turret",
        "kr-nuclear-locomotive", "kr-nuclear-reactor-equipment", "se-antimatter-reactor",
        "se-space-radiation-laboratory" }
else
    k2_se_list = { "kr-antimatter-reactor-equipment", "kr-antimatter-ammo", "se-antimatter-reactor",
        "se-space-radiation-laboratory", "kr-nuclear-locomotive", "kr-nuclear-reactor-equipment",
        "fusion-reactor-equipment", "spidertron", "kr-rocket-turret" }
end
addResearchData(k2_se_list)
data.raw["item"]["graphite-fuel-cell"].fuel_value = "19GJ"
data.raw["item"]["plutonium-fuel-cell"].fuel_value = "63GJ"
data.raw["item"]["MOX-fuel-cell"].fuel_value = "75GJ"
data.raw["item"]["thorium-fuel-cell"].fuel_value = "100GJ"
modifyResults("graphite-fuel-cell-recipe", { {
    type = "item",
    name = "graphite-fuel-cell",
    amount = 1
} })
modifyResults("plutonium-fuel-cell-recipe", { {
    type = "item",
    name = "plutonium-fuel-cell",
    amount = 1
} })
modifyResults("MOX-fuel-cell-recipe", { {
    type = "item",
    name = "MOX-fuel-cell",
    amount = 1
} })
modifyResults("thorium-fuel-cell-recipe", { {
    type = "item",
    name = "thorium-fuel-cell",
    amount = 1
} })
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
