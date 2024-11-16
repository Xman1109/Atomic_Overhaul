-- when isotope-analysis is researched, print a chat message to the force
function IsotopeAnalysis(event)
    if event.research.name == "isotope-analysis" then
        for _, player in pairs(game.players) do
            player.print({"chat-message.isotope-analysis"})
        end
    end
end