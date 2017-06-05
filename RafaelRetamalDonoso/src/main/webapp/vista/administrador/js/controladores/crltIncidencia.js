/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

app.controller("incidenciasCtrl", function ($scope) {
    $scope.newIncidencia = {
        idIncidencia: 0,
        tipo: 'error',
        estado: 'abierta',
        descripcion: '',
        prestatario: null,
        equipo: null
    };
    $scope.modIncidencia = null;
    $scope.equipos = [];
    $scope.prestatarios = [];
    $scope.incidencias = [];

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

            
            }, error: function (jqXHR, textStatus, errorThrown) {
//                alert("mal");
            }
        });

    };
    $scope.getEquipos = function () {
        $.ajax({
            data: {"getEquipos": "toda"},
            async: false,
            url: '../../ControlEquipo',
            type: 'post',
            dataType: "json",
            beforeSend: function () {

            },
            success: function (response) {
                // alert("Inicialidad:"+$scope.marcas);

                $scope.equipos = response;
                Command: toastr["success"]("Se han cargado las equipo correctamente!");

                
            }, error: function (jqXHR, textStatus, errorThrown) {
                Command: toastr["error"]("No se ha podido cargar los equipos!");

            }
        });

    };
    $scope.addIncidencia = function () {
        if (typeof $scope.newIncidencia.prestatario === 'string') {
            $scope.newIncidencia.prestatario = JSON.parse($scope.newIncidencia.prestatario);
        }
        if (typeof $scope.newIncidencia.equipo === 'string') {
            $scope.newIncidencia.equipo = JSON.parse($scope.newIncidencia.equipo);
        }


        var parametros = {
            "newincidencia": angular.toJson($scope.newIncidencia)
        };
        $.ajax({
            data: parametros,
            url: '../../ControlIncidencia',
            type: 'post',
            beforeSend: function () {

            },
            success: function (response) {
                Command: toastr["success"]("Se han añadido correctamente!");

               
            }, error: function (jqXHR, textStatus, errorThrown) {
                Command: toastr["error"]("No se ha podido añadir!");

              
            }
        });
        $scope.newIncidencia = {
            idIncidencia: 0,
            tipo: 'error',
            estado: 'abierta',
            descripcion: '',
            prestatario: null,
            equipo: null
        };

    };
    $scope.getIncidencia = function () {
        $.ajax({
            data: {"getIncidencia": "toda"},
            async: false,
            url: '../../ControlIncidencia',
            type: 'post',
            dataType: "json",
            beforeSend: function () {

            },
            success: function (response) {
                // alert("Inicialidad:"+$scope.marcas);
                $scope.incidencias = response;
                // alert(response);
//                alert("bien");
                Command: toastr["success"]("Se han cargado las incidencia correctamente!");

            }, error: function (jqXHR, textStatus, errorThrown) {
//                alert("mal");
            }
        });

    };
    $scope.elecionIncidencia = function (id) {

        for (i = 0; i < $scope.incidencias.length; i++) {
            if ($scope.incidencias[i].idIncidencia == id) {
                $scope.modIncidencia = $scope.incidencias[i];
            }

        }

    };
    $scope.updateIncidencia = function () {
        if ($scope.modIncidencia.prestatario == null) {
            $scope.modIncidencia.prestatario = null
        }
         if ($scope.modIncidencia.equipo == null) {
            $scope.modIncidencia.equipo = null
        }
        var parametros = {
            "modincidencia": angular.toJson($scope.modIncidencia)
        };
        $.ajax({
            data: parametros,
            url: '../../ControlIncidencia',
            type: 'post',
            beforeSend: function () {

            },
            success: function (response) {
                Command: toastr["success"]("Se ha modificado correctamente!");

          
            }, error: function (jqXHR, textStatus, errorThrown) {
                Command: toastr["error"]("No se ha podido añadir!");

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
        $scope.modIncidencia = null;

    };

    $scope.inicializar = function () {
        $scope.getEquipos();
        $scope.getPrestatarios();
        $scope.getIncidencia();
    };
    $scope.inicializar();
    $(document).ready(function () {
        // $scope.getMarcas();

        $('#example').DataTable({
            "language": {
                "sProcessing": "Procesando...",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "No se encontraron resultados",
                "sEmptyTable": "Ningún dato disponible en esta tabla",
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
