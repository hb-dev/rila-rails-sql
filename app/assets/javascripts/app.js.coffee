dependencies = [
  'ngRoute'
  'templates'
  'rilaControllers'
  'rilaServices'
  'ui.bootstrap'
  'nya.bootstrap.select'
]

config = ($routeProvider, $locationProvider ) ->
  $routeProvider
  .when '/',
    controller: 'myCtrl'
    templateUrl: '../views/home.html'
  .when '/events/:eventId',
    controller: 'EventRegistrationsCtrl'
    templateUrl: 'events/event-registrations.html'
  .otherwise
    redirectTo: '/'

  $locationProvider.html5Mode
  	enabled: true
  	requireBase: false

angular
	.module('rilaApp', dependencies)
	.config [
	  '$routeProvider'
	  '$locationProvider'
	  config
	]
