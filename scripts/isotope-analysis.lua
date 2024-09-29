-- when isotope-analysis is researched, print a chat message to the force
script.on_event(defines.events.on_research_finished, function(event)
    if event.research.name == "isotope-analysis" then
        for _, player in pairs(game.players) do
            player.print({"chat-message.isotope-analysis"})
        end
    end
end)