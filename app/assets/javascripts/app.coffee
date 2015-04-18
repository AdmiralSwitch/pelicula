pelicula = angular.module('pelicula',[
  'templates',
  'ngRoute',
  'controllers',
])

pelicula.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'MoviesController'
      )
])

movies = [
  {
    id: 1
    title: 'Hellboy'
  },
  {
    id: 2
    title: 'The Fifth Element',
  },
  {
    id: 3
    title: 'Full Metal Jacket',
  },
  {
    id: 4
    title: 'The Watchmen',
  },
  {
    id: 5
    title: 'There Will Be Blood',
  },
  {
    id: 6
    title: 'Hot Tub Time Machine 2',
  },
  {
    id: 7
    title: 'Hellboy II: The Golden Army',
  },
]

controllers = angular.module('controllers',[])
controllers.controller("MoviesController", [ '$scope', '$routeParams', '$location',
  ($scope,$routeParams,$location)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)

    if $routeParams.keywords
      keywords = $routeParams.keywords.toLowerCase()
      $scope.movies = movies.filter (movie)-> movie.title.toLowerCase().indexOf(keywords) != -1
    else
      $scope.movies = []
])