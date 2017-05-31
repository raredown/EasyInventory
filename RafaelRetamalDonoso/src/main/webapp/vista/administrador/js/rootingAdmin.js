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
app.controller("usuarioCtrl", function ($scope) {
    $scope.newUsuario = {
        idUsuarios: 0,
        username: '',
        pasword: '',
        tipo: 'prestatarios',
        prestatarios: {
            idPrestatarios: 0,
            telefono: '',
            nombre: '',
            apellido: ''
        }

    };
    $scope.newPass='';
    $scope.miUsuario = {
        idUsuarios: 10,
        username: 'username',
        pasword: 'contraseña',
        tipo: 'prestatarios',
        prestatarios: {
            idPrestatarios: 10,
            telefono: '924670924',
            nombre: 'rafa',
            apellido: 'retamal donoso'
        }

    };
    $scope.addUsuario = function () {
        // $scope.categorias.push($scope.newCategoria);
        var parametros = {
            "newusuario": angular.toJson($scope.newUsuario)
        };
        $.ajax({
            data: parametros,
            url: '../../ControlUsuarioAdmin',
            type: 'post',
            beforeSend: function () {

            },
            success: function (response) {
                Command: toastr["success"]("Se ha añadido correctamente!");

                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-top-center",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
            }, error: function (jqXHR, textStatus, errorThrown) {
                Command: toastr["error"]("No se ha podido añadir,ya existe el usuario!");

                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-top-center",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
            }
        });
        $scope.newUsuario = {
            idUsuarios: 0,
            username: '',
            tipo: 'prestatarios',
            prestatarios: {
                idPrestatarios: 0,
                telefono: '',
                nombre: '',
                apellido: ''
            }

        };

    };
    $scope.getMiUsuario = function(){
        $.ajax({
            data: {"getMiUsuario": "toda"},
            async: false,
            url: '../../ControlUsuarioAdmin',
            type: 'post',
            dataType: "json",
            beforeSend: function () {

            },
            success: function (response) {
                // alert("Inicialidad:"+$scope.marcas);
                $scope.miUsuario = response;
                // alert(response);
                Command: toastr["success"]("Se han cargado tu usuario correctamente!");

                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-top-center",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
            }, error: function (jqXHR, textStatus, errorThrown) {
                Command: toastr["error"]("No se ha podido cargar tu usuario!");

                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": true,
                    "positionClass": "toast-top-center",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
            }
        });
    };



});