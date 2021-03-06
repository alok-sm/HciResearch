'use strict';

angular.module('ngPlayerApp')
    .controller('ViewerCtrl', function ($routeParams, $scope, $localStorage, fileapi) {
        function renderEventLog(eventLog){
            $scope.eventLog = eventLog;
        }

        $scope.$localStorage = $localStorage;
        $scope.recordingId = $routeParams.id;
        $scope.runnable = $routeParams.runnable === '1';

        if(!$localStorage[$scope.recordingId]){
            $localStorage[$scope.recordingId] = {
                home: '$HOME'
            };
        }

        fileapi.readWindows($routeParams.id).then(renderEventLog);
    });
