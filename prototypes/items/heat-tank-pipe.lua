if settings.startup["ao-complexity-level"].value ~= "simple" then
    heat_fluid_tank = util.table.deepcopy(data.raw["item"]["storage-tank"])

    heat_fluid_tank.name = "heat-tank-pipe"
    heat_fluid_tank.place_result = "heat-tank-pipe"
    heat_fluid_tank.icon = graphics .. "heat-tank-pipe.png"

    data:extend({ heat_fluid_tank })
end