local smoke = table.deepcopy(data.raw["trivial-smoke"]["poison-capsule-particle-smoke"])
smoke.name = "X17-capsule-particle-smoke"
smoke.color = {r = 1, g = 0, b = 0, a = 0.8}

data:extend({smoke})