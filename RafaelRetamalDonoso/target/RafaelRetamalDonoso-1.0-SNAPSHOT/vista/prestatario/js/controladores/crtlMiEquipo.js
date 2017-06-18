/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


app.controller("miEquipoCtrl", function ($scope) {

    $scope.equipos = [];
    $scope.historico = [];

    $scope.newIncidencia = {
        idIncidencia: 0,
        tipo: 'error',
        estado: 'abierta',
        descripcion: '',
        equipo: $scope.modEquipo
    };
    $scope.getHistorico = function (id) {
        $.ajax({
            data: {"getHistorico": id},
            async: false,
            url: '../../ControlIncidencia',
            type: 'post',
            dataType: "json",
            beforeSend: function () {

            },
            success: function (response) {
                // alert("Inicialidad:"+$scope.marcas);
                $scope.historico = response;
                // alert(response);
//                alert("bien");
                Command: toastr["success"]("Se han cargado las incidencia correctamente!");


            }, error: function (jqXHR, textStatus, errorThrown) {
//                alert("mal");
            }
        });

    };
    $scope.getEquipos = function () {
        $.ajax({
            data: {"getEquiposUsuario": "toda"},
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
    $scope.elecionEquipo = function (id) {

        for (i = 0; i < $scope.equipos.length; i++) {
            if ($scope.equipos[i].idEquipo == id) {
                $scope.modEquipo = $scope.equipos[i];

            }

        }

    };
    $scope.ponerIncidencia = function () {
        $scope.newIncidencia.equipo = $scope.modEquipo;
        var parametros = {
            "newpedido": angular.toJson($scope.newIncidencia)
        };
        $.ajax({
            data: parametros,
            url: '../../ControlIncidencia',
            type: 'post',
            beforeSend: function () {

            },
            success: function (response) {
                Command: toastr["success"]("Se ha podido poner incidencia correctamente!");


            }, error: function (jqXHR, textStatus, errorThrown) {
                Command: toastr["error"]("No se ha podido poner incidencia!");


            }
        });
        $scope.newIncidencia = {
            idIncidencia: 0,
            tipo: 'error',
            estado: 'abierta',
            descripcion: '',
            equipo: $scope.modEquipo
        };

    };
    $scope.inicializar = function () {
        $scope.getEquipos();
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