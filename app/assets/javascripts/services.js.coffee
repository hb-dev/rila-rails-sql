rilaServices = angular.module 'rilaServices', ['ngResource']

# rilaServices.factory('Enrollment', ['$resource',
#   function($resource){
#     return $resource('/api/enrollments/:id', { id: "@id" }, {
#       'create':  { method: 'POST' }
#     });
#   }
#  ]);

# rilaServices.factory('Relay', ['$resource',
#   function($resource){
#     return $resource('/api/relays/:id', { id: "@id" }, {
#       'create':  { method: 'POST' }
#     });
#   }
#  ]);

rilaServices.factory 'Event', ($resource) ->
  $resource('/api/events/:id', { id: "@id" }, {'show': { method: 'GET', isArray: false }})

# rilaServices.factory('Run', ['$resource',
#   function($resource){
#     return $resource('/api/runs/:id', { id: "@id" }, {
#       'index':   { method: 'GET', isArray: true },
#       'show':   { method: 'GET', isArray: false }
#     });
#   }
# ]);
