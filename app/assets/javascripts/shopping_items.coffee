# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
app = angular.module("shoppingList", []);
app.factory('shoppingItems', ['$http', ($http) ->
  service = 
    items: []
    getAll: () ->
      $http.get('/shopping_items.json').success((data) -> angular.copy(data, service.items))
    create: (new_item) ->
      $http.post('/shopping_items', new_item).success((data) -> service.items.push(data))
    delete: (item) ->
      $http.delete('/shopping_items/' + item.id) 
])

app.controller("shoppingItemsController", ['$scope', '$http', 'shoppingItems', ($scope, $http, shoppingItems) -> 
    $scope.sabor = 'limon'
    $scope.order_type = 'asc'
    $scope.items = shoppingItems.items
    shoppingItems.getAll()

    $scope.create = (new_item) ->
      shoppingItems.create(new_item).then(()-> $scope.new_item = "")
    $scope.remove = (item) ->
      shoppingItems.delete(item).then () -> 
        idx = $scope.items.indexOf(item)
        $scope.items.splice(idx, 1);
    $scope.changeOrder = () ->
      $scope.order_type = if $scope.order_type == 'desc' then 'asc' else 'desc'
])
