local cloud = table.deepcopy(data.raw["smoke-with-trigger"]["poison-cloud-visual-dummy"])
cloud.name = "X17-cloud-visual-dummy"
cloud.color = {r = 1, g = 0, b = 0, a = 0.8}

data:extend({cloud})