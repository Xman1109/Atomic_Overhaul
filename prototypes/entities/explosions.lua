local cooled_explosion = table.deepcopy(data.raw["explosion"]["explosion"])
local catalyser_explosion = table.deepcopy(data.raw["explosion"]["explosion"])
local shielded_explosion = table.deepcopy(data.raw["explosion"]["explosion"])

cooled_explosion.name = "cooling-upgrade-explosion"
cooled_explosion.sound = nil

catalyser_explosion.name = "catalyser-upgrade-explosion"
catalyser_explosion.sound = nil

shielded_explosion.name = "shielded-upgrade-explosion"
shielded_explosion.sound = nil

data:extend({cooled_explosion, catalyser_explosion, shielded_explosion})