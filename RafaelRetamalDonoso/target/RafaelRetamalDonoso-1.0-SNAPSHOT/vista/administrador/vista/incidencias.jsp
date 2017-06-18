<%-- 
    Document   : incidencias
    Created on : 01-jun-2017, 8:40:50
    Author     : rretamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-primary" >
            <div class="panel-heading" id="panelEquipo">Panel Incidencia <a data-toggle="modal" data-target="#anadir"><span class="glyphicon glyphicon-plus pull-right"></span></a></div>
            <div class="panel-body">
                <table id="example" class="display" cellspacing="0" width="100%">

                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Tipo</th>
                            <th>Descripcion</th>
                            <th>Prestatario</th>
                            <th>Equipo</th>
                            <th>Fecha de creación</th>
                            <th>Fecha de resolución</th>
                            <th>Resolucion</th>
                            <th>Estado</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Id</th>
                            <th>Tipo</th>
                            <th>Descripcion</th>
                            <th>Prestatario</th>
                            <th>Equipo</th>
                            <th>Fecha de creación</th>
                            <th>Fecha de resolución</th>
                            <th>Resolucion</th>
                            <th>Estado</th>
                            <th>Opciones</th>
                        </tr>
                    </tfoot>

                    <tbody>
                        <tr ng-repeat="x in incidencias" >
                            <td>{{x.idIncidencia}}</td>
                            <td>{{x.tipo}}</td>
                            <td>{{x.descripcion}}</td>
                            <td>{{x.prestatario.nombre}}</td>
                            <td>{{x.equipo.demoninacion}}</td>
                            <td>{{x.createDate}}</td>
                            <td>{{x.seResolvio}}</td>
                            <td>{{x.resolucion}}</td>
                            <td>{{x.estado}}</td>
                            <td ng-if="x.estado == 'abierta'"><a data-toggle="modal" data-target="#modificar" ng-click="elecionIncidencia(x.idIncidencia)"><span class="glyphicon glyphicon-pencil pull-center glyfmod"></span></a></td>
                            <td ng-if="x.estado == 'cerrada'"></td>
                        </tr>
                    </tbody>

                </table>

            </div>
            <div class="panel-footer">

            </div>
        </div>
    </div>

    <div class="modal fade" id="anadir" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Añadir Incidencia</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="Descripcion">Descripción:</label>
                            <textarea class="form-control" rows="5" id="comment" ng-model="newIncidencia.descripcion"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="sel1">Equipo:</label>
                            <select class="form-control" id="sel1" ng-model="newIncidencia.equipo">
                                <!--<option value="0" selected="true">Nueva Marca</option>-->
                                <option ng-repeat="option in equipos" value="{{option}}">{{option.demoninacion}}</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sel1">Prestatario:</label>
                            <select class="form-control" id="sel1" ng-model="newIncidencia.prestatario">
                                <!--<option value="0" selected="true">Nueva Marca</option>-->
                                <option ng-repeat="option in prestatarios" value="{{option}}">{{option.nombre}}</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="tipo">Tipo:</label>
                            <label class="radio-inline"><input type="radio" name="optradio" ng-model="newIncidencia.tipo" value="error">Error</label>
                            <label class="radio-inline"><input type="radio" name="optradio" ng-model="newIncidencia.tipo" value="pedido">Pedido</label>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal" ng-click="addIncidencia()">Añadir</button>
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
                    <h4 class="modal-title">Cerrar esta incidencia?</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="Descripcion">Descripción de resolucion:</label>
                            <textarea class="form-control" rows="5" id="comment" ng-model="modIncidencia.resolucion"></textarea>
                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal" ng-click="updateIncidencia()">Cerrar</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal" >Cancelar</button>
                </div>
            </div>

        </div>
    </div>

</div>
