ListApp = angular.module("ListApp", ["ngRoute", "tempates"])

ListApp.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when '/',
			templateUrl: 'index.html',
			controller: "ListCtrl"
		.otherwise
			redirectTo: "/"

		$locationProvider.html5Mode(true)

]

#List controller
ListApp.controller "ListCtrl", ["$scope", "$http", ($scope, $http) ->
	$scope.lists = []

	$scope.getLists = ->
		$http.get("/lists.json").success (data) ->
			$scope.lists = data

	$scope.getLists()

	#create
	$scope.addList = ->
		$http.post("/lists.json", $scope.newList).success (data) ->
			$scope.newList = {}
			$scope.lists.push(data)

	#delete
	$scope.deleteList = (list) ->
		conf = confirm "you sure?"
		if conf
			$http.delete("/lists/#{list.id}.json").success (data) ->
				$scope.lists.splice($scope.lists.indexOf(list), 1)


	#show edit form
	$scope.showList = (list) ->
		$http.put("/lists/#{this.list.id}.json", list).success (data) ->
			$scope.book = subldata

	#edit
	$scope.editList = (list) ->
		this.checked = false
		$http.put("/lists/#{this.list.id}.json", list).success (data) ->

]

#config for CSRF token
ListApp.config ["httpProvider", ($httpProvider) ->
	$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]

