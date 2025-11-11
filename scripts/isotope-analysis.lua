-- when isotope-analysis is researched, print a chat message to the force
function IsotopeAnalysis(event)
    if event.research.name == "isotope-analysis" then
        event.research.force.print({ "chat-message.isotope-analysis" })
    end
end