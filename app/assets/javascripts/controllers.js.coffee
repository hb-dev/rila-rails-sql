rilaControllers = angular.module "rilaControllers", []

rilaControllers.controller 'EventRegistrationsCtrl', ["$scope", "$attrs", "Event", ($scope, $attrs, Event) ->
  $scope.theEvent = Event.show {id: $attrs.eventid}, (theEvent) -> 
    $scope.runs = theEvent.runs
    $scope.selectedRun = $scope.runs[0]
  $scope.showTotal = true
]