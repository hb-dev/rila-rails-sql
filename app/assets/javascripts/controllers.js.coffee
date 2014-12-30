rilaControllers = angular.module "rilaControllers", []

rilaControllers.controller 'EventRegistrationsCtrl', ($scope, $routeParams, Event) ->
  $scope.theEvent = Event.show {id: $routeParams.eventId}, (theEvent) -> 
    $scope.runs = theEvent.runs
    $scope.selectedRun = $scope.runs[0]
  $scope.showTotal = true;
