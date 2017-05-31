/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var app = angular.module("myApp", ["ngRoute"]);
app.config(function ($routeProvider) {
    $routeProvider
            .when("/", {
                templateUrl: "main.html"
            })
            .when("/usuario", {
                templateUrl: "vista/usuario.jsp",
                controller: "usuarioCtrl"
            })
            .when("/equipo", {
                templateUrl: "vista/equipo.jsp",
                controller: "equipoCtrl"
            })
            .when("/categoria", {
                templateUrl: "vista/categoria.jsp",
                controller: "categoriaCtrl"
            })
            .when("/marca", {
                templateUrl: "vista/marca.jsp",
                controller: "marcaCtrl"
            });
});
