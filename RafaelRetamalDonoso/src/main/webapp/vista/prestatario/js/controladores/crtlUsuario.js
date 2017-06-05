/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
app.controller("usuarioCtrl", function ($scope) {

    $scope.newPass = '';
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
    $scope.getMiUsuario = function () {
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

            }, error: function (jqXHR, textStatus, errorThrown) {
                Command: toastr["error"]("No se ha podido cargar tu usuario!");

            }
        });
    };
    $scope.modUsuario = function () {
        // $scope.categorias.push($scope.newCategoria);
        $scope.miUsuario.pasword =$scope.newPass;
        var parametros = {
            "modUsuario": angular.toJson($scope.miUsuario)
        };
        $.ajax({
            data: parametros,
            url: '../../ControlUsuarioAdmin',
            type: 'post',
            beforeSend: function () {

            },
            success: function (response) {
                Command: toastr["success"]("Se ha modificado correctamente!");

            }, error: function (jqXHR, textStatus, errorThrown) {
                Command: toastr["error"]("No se ha podido modificar!");

            }
        });
       

    };


    $scope.getMiUsuario();
});

