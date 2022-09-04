require("util")

heat_furnace = util.table.deepcopy(data.raw["furnace"]["electric-furnace"])
heat_furnace.name = "heat-furnace"
heat_furnace.energy_source =
{
    type = "heat",
    max_temperature = 1000,
    specific_heat = "1MJ",
    max_transfer = "2GW",
    min_working_temperature = 500,
    minimum_glow_temperature = 350,
    connections =
    {
        {
            position = { 0, 1 },
            direction = defines.direction.south
        },
        {
            position = { 0, -1 },
            direction = defines.direction.north
        },
        {
            position = { 1, 0 },
            direction = defines.direction.east
        },
        {
            position = { -1, 0 },
            direction = defines.direction.west
        }
    },
}
data:extend({
    heat_furnace
})
