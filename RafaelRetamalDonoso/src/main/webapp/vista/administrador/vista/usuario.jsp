<%-- 
    Document   : usuario
    Created on : 27-may-2017, 22:30:47
    Author     : rafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row" id="panelEquipo">

    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading"> Admin Usuarios<a data-toggle="modal" data-target="#anadir"><span class="glyphicon glyphicon-plus pull-right"></span></a></div>

           <div class="panel-body">
                <div class="row">
                    <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="http://www.coordinadora.com/wp-content/uploads/sidebar_usuario-corporativo.png" class="img-circle img-responsive"> </div>

       
                    <div class=" col-md-9 col-lg-9 "> 
                        <table class="table table-user-information">
                            <tbody>
                                <tr>
                                    <td>Usuario:</td>
                                    <td>{{miUsuario.username}}</td>
                                </tr>
                                <tr>
                                    <td>Tipo:</td>
                                    <td>{{miUsuario.tipo}}</td>
                                </tr>
                                <tr>
                                    <td>Telefono:</td>
                                    <td>{{miUsuario.prestatarios.telefono}}</td>
                                </tr>

                                <tr>
                                <tr>
                                    <td>Nombre:</td>
                                    <td>{{miUsuario.prestatarios.nombre}}</td>
                                </tr>
                                <tr>
                                    <td>Apellidos</td>
                                    <td>{{miUsuario.prestatarios.apellido}}</td>
                                </tr>
                      

                            </tr>

                            </tbody>
                        </table>

                    </div>
                </div>
            </div>
             <div class="panel-footer">
                <a data-original-title="Broadcast Message" data-toggle="modal" data-target="#anadir" data-toggle="tooltip" type="button" class="btn btn-sm btn-primary"><i class="glyphicon glyphicon-plus"></i></a>
                <span class="pull-right">
                    <a data-original-title="Edit this user" data-toggle="modal" data-target="#modificar" data-toggle="tooltip" type="button" class="btn btn-sm btn-warning"><i class="glyphicon glyphicon-edit"></i></a>
                </span>
            </div>
        </div>
     
    </div>

    <!-- Modal  Añadir-->
    <div class="modal fade" id="anadir" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Añadir Usuario</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" class="form-control" id="username" placeholder="username" ng-model="newUsuario.username">
                        </div>
                        <div class="form-group">
                            <label for="tipo">Tipo:</label>
                            <label class="radio-inline"><input type="radio" name="optradio" ng-model="newUsuario.tipo" value="prestatarios">Prestatarios</label>
                            <label class="radio-inline"><input type="radio" name="optradio" ng-model="newUsuario.tipo" value="admin">Administrador</label>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Telefono:</label>
                            <input type="text" class="form-control" id="telefono" placeholder="telefono" ng-model="newUsuario.prestatarios.telefono">
                        </div>
                        <div class="form-group">
                            <label for="marca">Nombre:</label>
                            <input type="text" class="form-control" id="nombre" placeholder="nombre" ng-model="newUsuario.prestatarios.nombre">
                        </div>
                        <div class="form-group">
                            <label for="marca">Apellido</label>
                            <input type="text" class="form-control" id="apellido" placeholder="apellido" ng-model="newUsuario.prestatarios.apellido">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" ng-click="addUsuario()">Añadir</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal" >Cancelar</button>
                </div>
            </div>
            
            

        </div>
    </div>
        <div class="modal fade" id="modificar" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modificar Usuario</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="username">Username:</label>
                            <input type="text" class="form-control" id="username" placeholder="username" ng-model="miUsuario.username">
                        </div>
                          <div class="form-group">
                            <label for="username">Pasword:</label>
                            <input type="password" class="form-control" id="password" placeholder="password" ng-model="newPass">
                        </div>
                        <div class="form-group">
                            <label for="tipo">Tipo:</label>
                            <label class="radio-inline"><input type="radio" name="optradio" ng-model="miUsuario.tipo" value="prestatarios">Prestatarios</label>
                            <label class="radio-inline"><input type="radio" name="optradio" ng-model="miUsuario.tipo" value="admin">Administrador</label>
                        </div>
                        <div class="form-group">
                            <label for="telefono">Telefono:</label>
                            <input type="text" class="form-control" id="telefono" placeholder="telefono" ng-model="miUsuario.prestatarios.telefono">
                        </div>
                        <div class="form-group">
                            <label for="marca">Nombre:</label>
                            <input type="text" class="form-control" id="nombre" placeholder="nombre" ng-model="miUsuario.prestatarios.nombre">
                        </div>
                        <div class="form-group">
                            <label for="marca">Apellido</label>
                            <input type="text" class="form-control" id="apellido" placeholder="apellido" ng-model="miUsuario.prestatarios.apellido">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal" ng-click="">Modficar</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal" >Cancelar</button>
                </div>
            </div>
            
            

        </div>
    </div>
</div>