# -*- coding: utf-8 -*-
SimpleNavigation::Configuration.run do |navigation|
    navigation.items do |primary| 
      primary.dom_class = 'nav navbar-nav'
      primary.item :dashboard, 'Dashboard', root_path
      primary.item :events, 'Veranstaltungen', events_path
      # primary.item :reviews, 'Wunschliste', reviews_path
      # primary.item :profile, 'Profil', user_path do |user_menu|
      # 	user_menu.item :show, 'Anzeigen', user_path
      # 	user_menu.item :logout, 'Logout', destroy_user_session_path, :method => 'delete'
      # end
    end

end
