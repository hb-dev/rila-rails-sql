# -*- coding: utf-8 -*-
SimpleNavigation::Configuration.run do |navigation|
    navigation.items do |primary| 
      primary.dom_class = 'dropdown-menu'
      primary.item :registrations, "#{icon :list} Anmeldungen", event_path(@event)
      primary.item :results, "#{icon :time} Ergebnisse", results_event_path(@event)
      primary.item :new_registration, "#{icon :plus} Neue Anmeldung", select_run_event_path(@event)
      primary.item :nil, nil, nil, { class: "divider"}
      primary.item :runs, "#{icon :flag} Läufe verwalten", event_runs_path(@event)
      primary.item :edit_event, "#{icon :edit} Veranstaltung bearbeiten", edit_event_path(@event)  
    end
end
