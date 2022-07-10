data.raw["recipe"]["atomic-bomb"].icon = "__Krastorio2Assets__/icons/ammo/atomic-bomb.png"
data.raw["recipe"]["atomic-bomb"].icon_size = 64
data.raw["recipe"]["atomic-bomb"].icon_mipmaps = 4
data.raw["recipe"]["uranium-without-research-data"].results = {{
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
}}
data.raw["technology"]["nuclear-fuel-reprocessing"].effects = {{
    type = "unlock-recipe",
    recipe = "ao-nuclear-fuel-reprocessing"
}}
data.raw["recipe"]["nuclear-fuel-reprocessing"].hidden = true
local nfr = table.deepcopy(data.raw["recipe"]["nuclear-fuel-reprocessing"])
nfr.name = "ao-nuclear-fuel-reprocessing"
nfr.enabled = false
nfr.hidden = false
nfr.subgroup = "reprocessing"
nfr.order = "b"
nfr.localized_name = {"recipe-name.ao-nuclear-fuel-reprocessing"}
nfr.results = {{
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
}}
data:extend({nfr})

-- give every tech in list the research-data
if not mods["RealisticFusionPower"] then
    k2_se_list = {"kr-antimatter-ammo", "kovarex-enrichment-process", "kr-fusion-energy", "kr-antimatter-reactor",
                  "kr-antimatter-reactor-equipment", "fusion-reactor-equipment", "spidertron", "kr-rocket-turret",
                  "kr-nuclear-locomotive", "kr-nuclear-reactor-equipment", "se-antimatter-reactor",
                  "se-space-radiation-laboratory"}
else
    k2_se_list = {"kr-antimatter-reactor-equipment", "kr-antimatter-ammo", "se-antimatter-reactor",
                  "se-space-radiation-laboratory", "kr-nuclear-locomotive", "kr-nuclear-reactor-equipment",
                  "fusion-reactor-equipment", "spidertron", "kr-rocket-turret"}
end
for _, tech in pairs(k2_se_list) do
    table.insert(data.raw["technology"][tech].unit.ingredients, {
        type = "item",
        name = "research-data",
        amount = 1
    })
end

-- multiply the fuel_value by 6.25
data.raw["item"]["graphite-fuel-cell"].fuel_value = "19GJ"
data.raw["item"]["plutonium-fuel-cell"].fuel_value = "63GJ"
data.raw["item"]["MOX-fuel-cell"].fuel_value = "75GJ"
data.raw["item"]["thorium-fuel-cell"].fuel_value = "100GJ"

data.raw["recipe"]["graphite-fuel-cell-recipe"].results = {{
    type = "item",
    name = "graphite-fuel-cell",
    amount = 1
}}
data.raw["recipe"]["plutonium-fuel-cell-recipe"].results = {{
    type = "item",
    name = "plutonium-fuel-cell",
    amount = 1
}}
data.raw["recipe"]["MOX-fuel-cell-recipe"].results = {{
    type = "item",
    name = "MOX-fuel-cell",
    amount = 1
}}
data.raw["recipe"]["thorium-fuel-cell-recipe"].results = {{
    type = "item",
    name = "thorium-fuel-cell",
    amount = 1
}}

if settings.startup["se-addon"].value == true then
    table.insert(data.raw["technology"]["se-antimatter-reactor"].prerequisites, "space-reactor")
    data.raw["reactor"]["nuclear-reactor"].collision_mask =
        data.raw["transport-belt"]["transport-belt"].collision_mask or
            data.raw["assembling-machine"]["assembling-machine-1"].collision_mask
    data.raw["tool"]["research-data"].order = "zz"
    data.raw["recipe"]["research-data-recipe"].order = "zz"
    data.raw["item"]["nuclear-fuel"].order = "a"
    data.raw["item"]["nuclear-fuel"].group = "atomic-overhaul"
    data.raw["item"]["nuclear-fuel"].subgroup = "fuel"
    data.raw["recipe"]["nuclear-fuel-reprocessing"].results = {{
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
    }}

    if mods["space-exploration"] > "0.5.116" then
        data.raw["recipe"]["uranium-processing"].order = "b"
        data.raw["recipe"]["uranium-processing"].group = "atomic-overhaul"
        data.raw["recipe"]["uranium-processing"].subgroup = "resources"

        data.raw["item"]["uranium-235"].order = "c"
        data.raw["item"]["uranium-235"].group = "atomic-overhaul"
        data.raw["item"]["uranium-235"].subgroup = "resources"

        data.raw["item"]["uranium-238"].order = "b"
        data.raw["item"]["uranium-238"].group = "atomic-overhaul"
        data.raw["item"]["uranium-238"].subgroup = "resources"

        data.raw["item"]["uranium-fuel-cell"].order = "b"
        data.raw["item"]["uranium-fuel-cell"].group = "atomic-overhaul"
        data.raw["item"]["uranium-fuel-cell"].subgroup = "fuel-cells"

        data.raw["item"]["used-up-uranium-fuel-cell"].order = "b"
        data.raw["item"]["used-up-uranium-fuel-cell"].group = "atomic-overhaul"
        data.raw["item"]["used-up-uranium-fuel-cell"].subgroup = "used-up-fuel-cells"

        data.raw["recipe"]["uranium-fuel-cell"].order = "b"
        data.raw["recipe"]["uranium-fuel-cell"].group = "atomic-overhaul"
        data.raw["recipe"]["uranium-fuel-cell"].subgroup = "fuel-cells"

        data.raw["recipe"]["nuclear-fuel-reprocessing"].order = "b"
        data.raw["recipe"]["nuclear-fuel-reprocessing"].group = "atomic-overhaul"
        data.raw["recipe"]["nuclear-fuel-reprocessing"].subgroup = "reprocessing"

        data.raw["recipe"]["nuclear-fuel"].order = "a"
        data.raw["recipe"]["nuclear-fuel"].group = "atomic-overhaul"
        data.raw["recipe"]["nuclear-fuel"].subgroup = "fuel"

        data.raw["technology"]["se-centrifuge"].hidden = true

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
        data.raw["recipe"]["fuel-processing"].order = "a"
        data.raw["recipe"]["fuel-processing"].group = "intermediate-products"
        data.raw["recipe"]["fuel-processing"].subgroup = "fuel"
        -- loadDefaultOf("r", "fuel-processing")
        -- loadDefaultOf("r", "iron-gear-wheel")

        data.raw["recipe"]["se-processed-fuel-from-solid-fuel"].order = "a"
        data.raw["recipe"]["se-processed-fuel-from-solid-fuel"].group = "intermediate-products"
        data.raw["recipe"]["se-processed-fuel-from-solid-fuel"].subgroup = "fuel"

        data.raw["recipe"]["rocket-fuel"].order = "p"
        data.raw["recipe"]["rocket-fuel"].group = "intermediate-products"
        data.raw["recipe"]["rocket-fuel"].subgroup = "fuel"

        data.raw["recipe"]["se-liquid-rocket-fuel"].order = "p"
        data.raw["recipe"]["se-liquid-rocket-fuel"].group = "intermediate-products"
        data.raw["recipe"]["se-liquid-rocket-fuel"].subgroup = "fuel"

        --data.raw["recipe"]["se-rocket-fuel-from-water-copper"].order = "p"
        --data.raw["recipe"]["se-rocket-fuel-from-water-copper"].group = "intermediate-products"
        --data.raw["recipe"]["se-rocket-fuel-from-water-copper"].subgroup = "fuel"

        data.raw["recipe"]["se-vulcanite-rocket-fuel"].order = "p"
        data.raw["recipe"]["se-vulcanite-rocket-fuel"].group = "intermediate-products"
        data.raw["recipe"]["se-vulcanite-rocket-fuel"].subgroup = "fuel"

        data.raw["recipe"]["solid-fuel-from-light-oil"].order = "b[fluid-chemistry]-c[solid-fuel-from-light-oil]"
        data.raw["recipe"]["solid-fuel-from-light-oil"].group = "resources"
        data.raw["recipe"]["solid-fuel-from-light-oil"].subgroup = "fuel"

        data.raw["recipe"]["solid-fuel-from-petroleum-gas"].order =
            "b[fluid-chemistry]-d[solid-fuel-from-petroleum-gas]"
        data.raw["recipe"]["solid-fuel-from-petroleum-gas"].group = "resources"
        data.raw["recipe"]["solid-fuel-from-petroleum-gas"].group = "fuel"

        data.raw["recipe"]["solid-fuel-from-heavy-oil"].order = "b[fluid-chemistry]-e[solid-fuel-from-heavy-oil]"
        data.raw["recipe"]["solid-fuel-from-heavy-oil"].group = "resources"
        data.raw["recipe"]["solid-fuel-from-heavy-oil"].group = "fuel"
    end
end
