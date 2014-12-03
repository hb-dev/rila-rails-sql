require 'uri'

elephant_uri = URI.parse ENV['ELEPHANTSQL_URL']
db_config = {
  database: elephant_uri.path[1 .. -1],
  host: elephant_uri.host,
  port: elephant_uri.port,
  username: elephant_uri.user,
  password: elephant_uri.password
}

COUNTRIES = ["Afghanistan","Ägypten","Albanien","Algerien","Andorra","Angola","Anguilla","Antarktis","Antigua und Barbuda","Äquatorial Guinea","Argentinien","Armenien","Aruba","Aserbaidschan","Äthiopien","Australien","Bahamas","Bahrain","Bangladesh","Barbados","Belgien","Belize","Benin","Bermudas","Bhutan","Birma","Bolivien","Bosnien-Herzegowina","Botswana","Bouvet Inseln","Brasilien","Britisch-Indischer Ozean","Brunei","Bulgarien","Burkina Faso","Burundi","Chile","China","Christmas Island","Cook Inseln","Costa Rica","Dänemark","Deutschland","Djibuti","Dominika","Dominikanische Republik","Ecuador","El Salvador","Elfenbeinküste","Eritrea","Estland","Falkland Inseln","Färöer Inseln","Fidschi","Finnland","Frankreich","Französisch Guyana","Französisch Polynesien","Französisches Süd-Territorium","Gabun","Gambia","Georgien","Ghana","Gibraltar","Grenada","Griechenland","Grönland","Großbritannien","Guadeloupe","Guam","Guatemala","Guinea","Guinea Bissau","Guyana","Haiti","Heard und McDonald Islands","Honduras","Hong Kong","Indien","Indonesien","Irak","Iran","Irland","Island","Israel","Italien","Jamaika","Japan","Jemen","Jordanien","Jugoslawien","Kaiman Inseln","Kambodscha","Kamerun","Kanada","Kap Verde","Kasachstan","Kenia","Kirgisistan","Kiribati","Kokosinseln","Kolumbien","Komoren","Kongo","Kongo, Demokratische Republik","Kroatien","Kuba","Kuwait","Laos","Lesotho","Lettland","Libanon","Liberia","Libyen","Liechtenstein","Litauen","Luxemburg","Macao","Madagaskar","Malawi","Malaysia","Malediven","Mali","Malta","Marianen","Marokko","Marshall Inseln","Martinique","Mauretanien","Mauritius","Mayotte","Mazedonien","Mexiko","Mikronesien","Mocambique","Moldavien","Monaco","Mongolei","Montserrat","Namibia","Nauru","Nepal","Neukaledonien","Neuseeland","Nicaragua","Niederlande","Niederländische Antillen","Niger","Nigeria","Niue","Nord Korea","Norfolk Inseln","Norwegen","Oman","Österreich","Pakistan","Palästina","Palau","Panama","Papua Neuguinea","Paraguay","Peru","Philippinen","Pitcairn","Polen","Portugal","Puerto Rico","Qatar","Reunion","Ruanda","Rumänien","Rußland","Saint Lucia","Sambia","Samoa","Samoa","San Marino","Sao Tome","Saudi Arabien","Schweden","Schweiz","Senegal","Seychellen","Sierra Leone","Singapur","Slowakei","Slowenien","Solomon Inseln","Somalia","South Georgia, South Sandwich Isl.","Spanien","Sri Lanka","St. Helena","St. Kitts Nevis Anguilla","St. Pierre und Miquelon","St. Vincent","Süd Korea","Südafrika","Sudan","Surinam","Svalbard und Jan Mayen Islands","Swasiland","Syrien","Tadschikistan","Taiwan","Tansania","Thailand","Timor","Togo","Tokelau","Tonga","Trinidad Tobago","Tschad","Tschechische Republik","Tunesien","Türkei","Turkmenistan","Turks und Kaikos Inseln","Tuvalu","Uganda","Ukraine","Ungarn","Uruguay","Usbekistan","Vanuatu","Vatikan","Venezuela","Vereinigte Arabische Emirate","Vereinigte Staaten von Amerika","Vietnam","Virgin Island (Brit.)","Virgin Island (USA)","Wallis et Futuna","Weissrussland","Westsahara","Zentralafrikanische Republik","Zimbabwe","Zypern"]