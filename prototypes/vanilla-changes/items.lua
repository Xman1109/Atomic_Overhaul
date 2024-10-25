data.raw["item"]["nuclear-fuel"].group = "atomic-overhaul"
data.raw["item"]["nuclear-fuel"].subgroup = "fuel"
data.raw["item"]["nuclear-fuel"].order = "a"

data.raw["item"]["uranium-238"].group = "atomic-overhaul"
data.raw["item"]["uranium-238"].subgroup = "resources"
data.raw["item"]["uranium-238"].order = "b"

data.raw["item"]["uranium-235"].group = "atomic-overhaul"
data.raw["item"]["uranium-235"].subgroup = "resources"
data.raw["item"]["uranium-235"].order = "c"

data.raw["item"]["depleted-uranium-fuel-cell"].group = "atomic-overhaul"
data.raw["item"]["depleted-uranium-fuel-cell"].subgroup = "used-up-fuel-cells"
data.raw["item"]["depleted-uranium-fuel-cell"].order = "b"

data.raw["item"]["uranium-fuel-cell"].group = "atomic-overhaul"
data.raw["item"]["uranium-fuel-cell"].subgroup = "fuel-cells"
data.raw["item"]["uranium-fuel-cell"].order = "b"

data.raw["item"]["uranium-fuel-cell"].fuel_glow_color = { 0, 255, 0 }

if mods["SchallUraniumProcessing"] then
    regroup("i", "uranium-concentrate", "AO", "resources")
    regroup("i", "uranium-low-enriched", "AO", "resources")
end