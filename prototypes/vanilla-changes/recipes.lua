local uf_results
if settings.startup["ao-complexity-level"].value == "simple" then
    multiply_recipe(data.raw["recipe"]["nuclear-fuel-reprocessing"], 4)
    uf_results = {
        {
            type = "item",
            name = "fissile-products",
            amount = 1
        },
        mods["SchallUraniumProcessing"] and {
            type = "item",
            name = "uranium-concentrate",
            amount = 19
        }
        or {
            type = "item",
            name = "uranium-ore",
            amount = 190
        }
    }
else
    uf_results = { {
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
    } }

    data.raw["recipe"]["uranium-fuel-cell"].ingredients =
    {
        { "uranium-fuel-rod", 10 },
        { "empty-fuel-cell",  10 }
    }
end
data.raw["recipe"]["uranium-fuel-cell"].category = "centrifuging"
regroup("r", "uranium-processing", "AO", "resources", "b")
regroup("r", "nuclear-fuel-reprocessing", "AO", "reprocessing", "b")
regroup("r", "nuclear-fuel", "AO", "fuel", "a")
regroup("r", "uranium-fuel-cell", "AO", "fuel-cells", "b")
modifyResults("nuclear-fuel-reprocessing", uf_results, "replace")
if mods["SchallUraniumProcessing"] then
    regroup("r", "uranium-concentrate", "AO", "resources")
    regroup("r", "uranium-low-enriched", "AO", "resources")
    regroup("r", "uranium-235", "AO", "resources")
end
