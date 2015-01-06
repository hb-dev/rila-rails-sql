dependencies = [
  'ngRoute'
  'rilaControllers'
  'rilaServices'
  'ui.bootstrap'
  'nya.bootstrap.select'
  'uiSwitch'
]

config = ($routeProvider, $locationProvider, $httpProvider) ->
  $routeProvider
  # .when '/',
  #   controller: 'myCtrl'
  #   templateUrl: '../views/home.html'
  # .when '/events/:eventId',
  #   controller: 'EventRegistrationsCtrl'
  #   templateUrl: 'events/event-registrations.html'
  # .otherwise
  #   redirectTo: '/'

  $locationProvider.html5Mode
  	enabled: true
  	requireBase: false

  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

angular
	.module('rilaApp', dependencies)
	.config [
	  '$routeProvider'
	  '$locationProvider'
    '$httpProvider'
	  config
	]
