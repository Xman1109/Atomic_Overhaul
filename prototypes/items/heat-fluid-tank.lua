if settings.startup["ao-complexity-level"].value ~= "simple" then
    heat_fluid_tank = util.table.deepcopy(data.raw["item"]["storage-tank"])

    heat_fluid_tank.name = "heat-fluid-tank"
    heat_fluid_tank.place_result = "heat-fluid-tank"
    heat_fluid_tank.icon = graphics .. "heat-fluid-tank.png"

    if settings.startup["heat-accumulator"].value == false then
        heat_fluid_tank.localised_description = {"", {"settings-disabled.heat-fluid-tank"}, {"mod-setting-name.heat-accumulator"}}
    end

    data:extend({ heat_fluid_tank })

end