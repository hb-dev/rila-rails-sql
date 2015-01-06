rilaServices = angular.module 'rilaServices', ['ngResource']

rilaServices.factory 'Event', [ "$resource", ($resource) ->
  $resource	'/events/:id.json',	id: "@id" , 
  	'show': { method: 'GET', isArray: false }
  	'results': { method: 'GET', isArray: false, url: '/events/:id/results.json' }
]

rilaServices.factory 'Enrollment', [ "$resource", ($resource) ->
  $resource	'/enrollments/:id.json',	id: "@id" , 
  	'updateAttribute': { method: 'PUT', isArray: false, url: '/enrollments/:id/update_:attribute', params: {id: "@id", attribute: "@attribute"} }
]
rilaServices.factory 'Relay', [ "$resource", ($resource) ->
  $resource	'/relays/:id.json',	id: "@id" , 
  	'updateAttribute': { method: 'PUT', isArray: false, url: '/relays/:id/update_:attribute', params: {id: "@id", attribute: "@attribute"} }
]
