/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

app.controller("categoriaCtrl", function ($scope) {
    $scope.categorias = [
        {idCategoria: 300, nombre: 'ordenador'},
        {idCategoria: 301, nombre: 'movil'},
        {idCategoria: 302, nombre: 'portatil'}
    ];
    $scope.newCategoria = {idCategoria: 0, nombre: ''};
    $scope.addCategoria = function () {
       // $scope.categorias.push($scope.newCategoria);
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
                Command: toastr["success"]("Se ha añadido correctamente!");

            }, error: function (jqXHR, textStatus, errorThrown) {
                Command: toastr["error"]("No se ha podido añadir!");

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
                Command: toastr["success"]("Se han cargado las categoria correctamente!");

            }, error: function (jqXHR, textStatus, errorThrown) {
                Command: toastr["error"]("No se ha podido cargar las categorias!");

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
                Command: toastr["success"]("Se ha actualizado correctamente!");

                $scope.modCategoria = {idCategoria: 0, nombre: ''};
            }, error: function (jqXHR, textStatus, errorThrown) {
                Command: toastr["error"]("No se ha podido borrar!");

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
                Command: toastr["success"]("Se ha borrado correctamente!");

                $scope.modCategoria = {idCategoria: 0, nombre: ''};
            }, error: function (jqXHR, textStatus, errorThrown) {
                Command: toastr["error"]("No se ha podido borrar por que ahi un equipo que tiene esta categoria!");

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
