heat_fluid_tank = util.table.deepcopy(data.raw["item"]["storage-tank"])

heat_fluid_tank.name = "heat-fluid-tank"
heat_fluid_tank.place_result = "heat-fluid-tank"
heat_fluid_tank.icon = graphics .. "heat-fluid-tank.png"

data:extend({ heat_fluid_tank })