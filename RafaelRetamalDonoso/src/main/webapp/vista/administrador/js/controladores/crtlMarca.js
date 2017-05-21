/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

app.controller("marcaCtrl", function ($scope) {
    //Para testeos 
    $scope.marcas = [
        {idMarca: 300, nombre: 'hp'},
        {idMarca: 301, nombre: 'moster'},
        {idMarca: 302, nombre: 'asus'}
    ];
    $scope.modMarca = {idMarca: 0, nombre: ''};
    $scope.newMarca = {idMarca: 0, nombre: ''};
    
    $scope.addMarca = function () {
        $scope.marcas.push($scope.newMarca);
        var parametros = {
            "marquita": angular.toJson($scope.newMarca)
        };
        $.ajax({
            data: parametros,
            url: '../../ControlMarca',
            type: 'post',
            beforeSend: function () {

            },
            success: function (response) {
                alert("bien");
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert("mal");
            }
        });
        $scope.newMarca = {idMarca: 0, nombre: ''};

    };
    $scope.getMarcas = function () {
        $.ajax({
            data: {"getMarcas": "toda"},
            async: false,
            url: '../../ControlMarca',
            type: 'post',
            dataType: "json",
            beforeSend: function () {

            },
            success: function (response) {
                // alert("Inicialidad:"+$scope.marcas);
                $scope.marcas = response;
                // alert(response);
                alert("bien");
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert("mal");
            }
        });

    };

    //updateMarca
    $scope.elecionMarca = function (id) {

        for (i = 0; i < $scope.marcas.length; i++) {
            if ($scope.marcas[i].idMarca == id) {
                $scope.modMarca = $scope.marcas[i];
            }

        }

    };
    $scope.updateMarca = function () {

        var parametros = {
            "marquita": angular.toJson($scope.modMarca)
        };
        $.ajax({
            data: parametros,
            url: '../../ControlMarca',
            type: 'post',
            beforeSend: function () {

            },
            success: function (response) {
                alert("bien");
                $scope.modMarca = {idMarca: 0, nombre: ''};
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert("mal");
            }
        });


    };
    
    $scope.deleteMarca = function () {

        var parametros = {
            "borrarMarca": angular.toJson($scope.modMarca)
        };
        $.ajax({
            data: parametros,
            url: '../../ControlMarca',
            type: 'post',
            beforeSend: function () {

            },
            success: function (response) {
                window.location.href = '';
                alert("bien");
                $scope.modMarca = {idMarca: 0, nombre: ''};
            }, error: function (jqXHR, textStatus, errorThrown) {
                alert("mal");
            }
        });


    };
    $scope.getMarcas();

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
