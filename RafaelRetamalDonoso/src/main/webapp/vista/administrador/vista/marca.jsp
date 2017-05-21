<%-- 
    Document   : marca
    Created on : 20-may-2017, 23:24:08
    Author     : rafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row" id="panelEquipo">

    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">Marcas<a data-toggle="modal" data-target="#anadir"><span class="glyphicon glyphicon-plus pull-right"></span></a></div>
            <button ng-click="updateMarca()">Pruebas funcion</button>
            <div class="panel-body">
                <table id="example" class="display" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                             <th>Opción</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Opción</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr ng-repeat="x in marcas">
                            <td>{{x.idMarca}}</td>
                            <td>{{x.nombre}}</td>
                            <td><a data-toggle="modal" data-target="#modificar" ng-click="elecionMarca(x.idMarca)"><span class="glyphicon glyphicon-pencil pull-center glyfmod"></span></a><a data-toggle="modal" data-target="#borrar" ng-click="elecionMarca(x.idMarca)"><span class="glyphicon glyphicon-remove glyfrem"></span></a></td>
                        </tr>
                    </tbody>

                </table>

            </div>
            <div class="panel-footer">Panel Footer</div>
        </div>
    </div>

    <!-- Modal  Añadir-->
    <div class="modal fade" id="anadir" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Añadir Marca</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="marca">Marca:</label>
                            <input type="text" class="form-control" id="marca" placeholder="marca" ng-model="newMarca.nombre">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" ng-click="addMarca()">Añadir</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal" >Cancelar</button>
                </div>
            </div>

        </div>
    </div>
</div>

    <!-- Modal  Modificar-->
    <div class="modal fade" id="modificar" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modificar Marca {{modMarca.idMarca}}</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="marca">Marca:</label>
                            <input type="text" class="form-control" id="marca" placeholder="marca" ng-model="modMarca.nombre">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal" ng-click="updateMarca()">Modificar</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal" >Cancelar</button>
                </div>
            </div>

        </div>
    </div>
        <!-- Modal  Modificar-->
    <div class="modal fade" id="borrar" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Borrar Marca {{modMarca.idMarca}}</h4>
                </div>
                <div class="modal-body">
                    <h2>Seguro de borrar?</h2>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="deleteMarca()">Borrar</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal" >Cancelar</button>
                </div>
            </div>

        </div>
    </div>
</div>