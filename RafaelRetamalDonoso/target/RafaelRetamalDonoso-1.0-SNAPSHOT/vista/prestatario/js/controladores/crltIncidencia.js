/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

app.controller("incidenciasCtrl", function ($scope) {

    $scope.incidencias = [];

    $scope.getIncidencia = function () {
        $.ajax({
            data: {"getIncidenciaUsuario": "toda"},
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


    $scope.inicializar = function () {
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
