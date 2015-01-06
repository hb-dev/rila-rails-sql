rilaControllers = angular.module "rilaControllers", []

rilaControllers.controller 'EventRegistrationsCtrl', ["$scope", "$attrs", "Event", "Enrollment", "Relay", ($scope, $attrs, Event, Enrollment, Relay) ->
  $scope.theEvent = Event.show {id: $attrs.eventid}, (theEvent) -> 
    $scope.runs = theEvent.runs
    $scope.selectedRun = $scope.runs[0]

  $scope.update = (model, itemAttribute, itemId) ->
  	switch
  		when model == 'Enrollment' then model = Enrollment
  		when model == 'Relay' then model = Relay
  		else null

  	model.updateAttribute(id: itemId, attribute: itemAttribute)
  	
]

rilaControllers.controller 'EventResultsCtrl', ["$scope", "$attrs", "Event", ($scope, $attrs, Event) ->
  $scope.theEvent = Event.results {id: $attrs.eventid}, (theEvent) -> 
    $scope.runs = theEvent.runs
    $scope.selectedRun = $scope.runs[0]
  $scope.showTotal = true
]