table.insert(data.raw["lab"]["lab"].inputs, "research-data")
table.insert(data.raw["technology"]["nuclear-fuel-reprocessing"].prerequisites, "uranium-processing")

data.raw["technology"]["uranium-processing"].prerequisites = {"graphite-fuel-reprocessing"}
data.raw["technology"]["nuclear-power"].prerequisites = {"graphite-processing"}