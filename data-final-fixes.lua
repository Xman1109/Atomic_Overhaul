if mods["Clowns-Nuclear"] then
    if mods["Clowns-AngelBob-Nuclear"] then
        require(compatibility .. "madclown-angelbob")
    else
        require(compatibility .. "Clowns-Nuclear")
    end
end
if mods["Nuclear Fuel"] then
    require(compatibility .. "nuclear-fuel")
end
if mods["angelspetrochem"] then
    require(compatibility .. "angels-petrochem")
end
if mods["bobtech"] then
    require(compatibility .. "bobs-technology")
end