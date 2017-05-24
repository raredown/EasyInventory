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
            .when("/red", {
                templateUrl: "vista/tablaEquipos.jsp"
            })
            .when("/equipo", {
                templateUrl: "vista/equipo.jsp"
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
app.controller("categoriaCtrl", function ($scope) {
    $scope.categorias = [
        {idCategoria: 300, nombre: 'ordenador'},
        {idCategoria: 301, nombre: 'movil'},
        {idCategoria: 302, nombre: 'portatil'}
    ];
    $scope.newCategoria = {idCategoria: 0, nombre: ''};
    $scope.addCategoria = function () {
        $scope.categorias.push($scope.newCategoria);
        var parametros = {
            "newcategoria": angular.toJson($scope.newCategoria)
        };
        $.ajax({
            data: parametros,
            url: '../../ControlCategoria',
            type: 'post',
            beforeSend: function () {

            },
            success: function (response) {
                alert("bien");
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert("mal");
            }
        });
        $scope.newCategoria = {idCategoria: 0, nombre: ''};

    };
    $scope.getCategoria = function () {
        $.ajax({
            data: {"getCategoria": "toda"},
            async: false,
            url: '../../ControlCategoria',
            type: 'post',
            dataType: "json",
            beforeSend: function () {

            },
            success: function (response) {
                // alert("Inicialidad:"+$scope.marcas);
                $scope.categorias = response;
                // alert(response);
                alert("bien");
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert("mal");
            }
        });

    };
    
    //updateMarca
    $scope.elecionCategoria = function (id) {

        for (i = 0; i < $scope.categorias.length; i++) {
            if ($scope.categorias[i].idCategoria == id) {
                $scope.modCategoria = $scope.categorias[i];
            }

        }

    };
    $scope.updateCategoria = function () {

        var parametros = {
            "newcategoria": angular.toJson($scope.modCategoria)
        };
        $.ajax({
            data: parametros,
            url: '../../ControlCategoria',
            type: 'post',
            beforeSend: function () {

            },
            success: function (response) {
                alert("bien");
                $scope.modCategoria = {idCategoria: 0, nombre: ''};
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert("mal");
            }
        });


    };
    
    $scope.deleteCategoria = function () {

        var parametros = {
            "borrarCategoria": angular.toJson($scope.modCategoria)
        };
        $.ajax({
            data: parametros,
            url: '../../ControlCategoria',
            type: 'post',
            beforeSend: function () {

            },
            success: function (response) {
                window.location.href = '';
                alert("bien");
                $scope.modCategoria = {idCategoria: 0, nombre: ''};
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert("mal");
            }
        });


    };
    $scope.getCategoria();
    $(document).ready(function () {
        // $scope.getMarcas();
        $('#example').DataTable({
            "language": {
                "sProcessing": "Procesando...",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "NingÃºn dato disponible en esta tabla",
                "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "sInfoThousands": ",",
                "sLoadingRecords": "Cargando...",
                "oPaginate": {
                    "sFirst": "Primero",
                    "sLast": "Ãšltimo",
                    "sNext": "Siguiente",
                    "sPrevious": "Anterior"
                },
                "oAria": {
                    "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                }

            }});
    });
});
