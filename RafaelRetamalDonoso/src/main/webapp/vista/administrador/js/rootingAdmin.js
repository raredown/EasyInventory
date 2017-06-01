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
            .when("/incidencia", {
                templateUrl: "vista/incidencias.jsp",
                controller: "incidenciasCtrl"
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
app.controller("incidenciasCtrl", function ($scope) {
    $scope.newIncidencia = {
        idIncidencia: 0,
        tipo: '',
        estado: '',
        prestatario: {idPrestatarios: 0},
        equipo: {idEquipo: 0}
    };

    $scope.equipos = [];
    $scope.prestatarios = [];
    
    $scope.getPrestatarios = function () {
        $.ajax({
            data: {"getPrestatarios": "toda"},
            async: false,
            url: '../../ControlPrestatarios',
            type: 'post',
            dataType: "json",
            beforeSend: function () {

            },
            success: function (response) {
                // alert("Inicialidad:"+$scope.marcas);
                $scope.prestatarios = response;
                // alert(response);
//                alert("bien");
                Command: toastr["success"]("Se han cargado los prestatarios correctamente!");

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
//                alert("mal");
            }
        });

    };
});


function convertFileToDataURLviaFileReader(url, callback) {
    var xhr = new XMLHttpRequest();
    xhr.onload = function () {
        var reader = new FileReader();
        reader.onloadend = function () {
            callback(reader.result);
        }
        reader.readAsDataURL(xhr.response);
    };
    xhr.open('GET', url);
    xhr.responseType = 'blob';
    xhr.send();
}
convertFileToDataURLviaFileReader("logonegro.png", function (resulta) {

});