<%-- 
    Document   : equipo
    Created on : 20-may-2017, 23:24:08
    Author     : rafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row" id="panelEquipo">
    <div class="col-md-4">

    </div>
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-primary">
            <div class="panel-heading">Panel equipo <a data-toggle="modal" data-target="#anadir"><span class="glyphicon glyphicon-plus pull-right"></span></a></div>
            <div class="panel-body">
                <table id="example" class="display" cellspacing="0" width="100%">

                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Denominacion</th>
                            <th>Descripcion</th>
                            <th>numeroSerie:</th>
                            <th>Nombre Marca</th>
                            <th>Nombre categoria</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Id</th>
                            <th>Denominacion</th>
                            <th>Descripcion</th>
                            <th>numeroSerie:</th>
                            <th>Nombre Marca</th>
                            <th>Nombre categoria</th>
                            <th>Opciones</th>
                        </tr>
                    </tfoot>
 
                    <tbody>
                        <tr ng-repeat="x in equipos">
                            <td>{{x.idEquipo}}</td>
                            <td>{{x.demoninacion}}</td>
                            <td>{{x.descripcion}}</td>
                            <td>{{x.numeroSerie}}</td>
                            <td>{{x.marca.nombre}}</td>
                            <td>{{x.categoria.nombre}}</td>
                            <td><a data-toggle="modal" data-target="#modificar" ng-click="elecionMarca(x.idMarca)"><span class="glyphicon glyphicon-pencil pull-center glyfmod"></span></a><a data-toggle="modal" data-target="#borrar" ng-click="elecionMarca(x.idMarca)"><span class="glyphicon glyphicon-remove glyfrem"></span></a></td>
                        </tr>
                    </tbody>

                </table>

            </div>
            <div class="panel-footer">Panel Footer</div>
        </div>
    </div>

    <div class="modal fade" id="anadir" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Añadir Equipo</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="demoninacion">Demoninacion:</label>
                            <input type="text" class="form-control" id="demoninacion" placeholder="Demoninacion" ng-model="newEquipo.demoninacion">
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripcion:</label>
                            <textarea class="form-control" rows="5" id="descripcion" ng-model="newEquipo.descripcion"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="numeroSerie">NumeroSerie:</label>
                            <input type="text" class="form-control" id="numeroSerie" placeholder="NumeroSerie" ng-model="newEquipo.numeroSerie">
                        </div>
                        <div class="form-group">
                            <label for="sel1">Marca:</label>
                            <select class="form-control" id="sel1" ng-model="newEquipo.marca">
                                <!--<option value="0" selected="true">Nueva Marca</option>-->
                                <option ng-repeat="option in marcas" value="{{option}}">{{option.nombre}}</option>
                            </select>
                        </div>
                        <div class="form-group" ng-hide="newEquipo.marca.idMarca != 0">
                            <label for="marca">Nueva Marca:</label>
                            <input type="text" class="form-control" id="marca" placeholder="marca" ng-model="newEquipo.marca.nombre">
                        </div>
                        <div class="form-group">
                            <label for="sel1">Categoria:</label>
                            <select class="form-control" id="sel1" ng-model="newEquipo.categoria">
                                <!--<option value="0" selected="true">Nueva Marca</option>-->
                                <option ng-repeat="option2 in categorias" value="{{option2}}">{{option2.nombre}}</option>
                            </select>
                        </div>
                        <div class="form-group" ng-hide="newEquipo.categoria.idCategoria != 0">
                            <label for="marca">Nueva Categoria</label>
                            <input type="text" class="form-control" id="marca" placeholder="Categoria" ng-model="newEquipo.categoria.nombre">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" ng-click="addEquipo()">Añadir</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal" >Cancelar</button>
                </div>
            </div>

        </div>
    </div>
</div>
