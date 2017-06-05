<%-- 
    Document   : equipo
    Created on : 20-may-2017, 23:24:08
    Author     : rafa
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row" id="panelEquipo">
    <div class="col-md-4">

    </div>
    <!--Panel tabla-->
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-primary" id="pruebasPdf">
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
                            <th>Nombre Prestatario</th>
                            <th>Nombre Apellido</th>
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
                            <th>Nombre Prestatario</th>
                            <th>Nombre Apellido</th>
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
                            <td>{{x.prestatario.nombre}}</td>
                            <td>{{x.prestatario.apellido}}</td>
                            <td>
                                <a data-toggle="modal" data-target="#modificar" ng-click="elecionEquipo(x.idEquipo)"><span class="glyphicon glyphicon-pencil pull-center glyfmod"></span></a>
                                <a data-toggle="modal" data-target="#historico" ng-click="getHistorico(x.idEquipo)"><span class="glyphicon glyphicon-eye-open glyfmod"></span></a>
                                <a data-toggle="modal" data-target="#borrar" ng-click="elecionEquipo(x.idEquipo)"><span class="glyphicon glyphicon-remove glyfrem"></span></a>

                            </td>
                        </tr>
                    </tbody>

                </table>

            </div>
            <div class="panel-footer">
                <a data-original-title="Broadcast Message" type="button" class="btn btn-sm btn-primary" ng-click="generarPdf()"><i class="glyphicon glyphicon-plus"></i></a>

                <a data-original-title="Broadcast Message" type="button" class="btn btn-sm btn-primary" ng-click="demoFromHTML()"><i class="glyphicon glyphicon-plus"></i></a>
            </div>
        </div>
    </div>
    <!--Dialog añadir-->
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
                        <!--                        <div class="form-group" ng-hide="newEquipo.marca.idMarca != 0">
                                                    <label for="marca">Nueva Marca:</label>
                                                    <input type="text" class="form-control" id="marca" placeholder="marca" ng-model="newEquipo.marca.nombre">
                                                </div>-->
                        <div class="form-group">
                            <label for="sel1">Categoria:</label>
                            <select class="form-control" id="sel1" ng-model="newEquipo.categoria">
                                <!--<option value="0" selected="true">Nueva Marca</option>-->
                                <option ng-repeat="option2 in categorias" value="{{option2}}">{{option2.nombre}}</option>
                            </select>
                        </div>
                        <!--                        <div class="form-group" ng-hide="newEquipo.categoria.idCategoria != 0">
                                                    <label for="marca">Nueva Categoria</label>
                                                    <input type="text" class="form-control" id="marca" placeholder="Categoria" ng-model="newEquipo.categoria.nombre">
                                                </div>-->
                        <div class="form-group">
                            <label for="sel1">Prestatario:</label>
                            <select class="form-control" id="sel1" ng-model="newEquipo.prestatario">
                                <!--<option value="0" selected="true">Nueva Marca</option>-->
                                <option ng-repeat="option3 in prestatarios" value="{{option3}}">{{option3.nombre}}</option>
                            </select>
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
    <!--Dialog modificar-->
    <div class="modal fade" id="modificar" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modificar Equipo</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="demoninacion">Demoninacion:</label>
                            <input type="text" class="form-control" id="demoninacion" placeholder="Demoninacion" ng-model="modEquipo.demoninacion">
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripcion:</label>
                            <textarea class="form-control" rows="5" id="descripcion" ng-model="modEquipo.descripcion"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="numeroSerie">NumeroSerie:</label>
                            <input type="text" class="form-control" id="numeroSerie" placeholder="NumeroSerie" ng-model="modEquipo.numeroSerie">
                        </div>
                        <div class="form-group">
                            <label for="sel1">Marca:</label>
                            <select class="form-control" id="sel1" ng-model="modEquipo.marca">
                                <!--<option value="0" selected="true">Nueva Marca</option>-->
                                <option ng-repeat="option in marcas" value="{{option}}">{{option.nombre}}</option>
                            </select>
                        </div>
                        <!--                        <div class="form-group" ng-hide="modEquipo.marca.idMarca != 0">
                                                    <label for="marca">Nueva Marca:</label>
                                                    <input type="text" class="form-control" id="marca" placeholder="marca" ng-model="modEquipo.marca.nombre">
                                                </div>-->
                        <div class="form-group">
                            <label for="sel1">Categoria:</label>
                            <select class="form-control" id="sel1" ng-model="modEquipo.categoria">
                                <!--<option value="0" selected="true">Nueva Marca</option>-->
                                <option ng-repeat="option2 in categorias" value="{{option2}}">{{option2.nombre}}</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="sel1">Prestatario:</label>
                            <select class="form-control" id="sel1" ng-model="modEquipo.prestatario">
                                <!--<option value="0" selected="true">Nueva Marca</option>-->
                                <option ng-repeat="option3 in prestatarios" value="{{option3}}">{{option3.nombre}}</option>
                            </select>
                        </div>
                        <!--                        <div class="form-group" ng-hide="modEquipo.categoria.idCategoria != 0">
                                                    <label for="marca">Nueva Categoria</label>
                                                    <input type="text" class="form-control" id="marca" placeholder="Categoria" ng-model="modEquipo.categoria.nombre">
                                                </div>-->
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal" ng-click="updateEquipo()">Modificar</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal" >Cancelar</button>
                </div>
            </div>

        </div>
    </div>

    <!--Dialog Borrar-->
    <div class="modal fade" id="borrar" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Borrar Equipo {{modEquipo.idEquipo}}</h4>
                </div>
                <div class="modal-body">
                    <h2>Seguro de borrar?</h2>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="deleteEquipo()">Borrar</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal" >Cancelar</button>
                </div>
            </div>

        </div>
    </div>
    <!--Dialog Historico-->
    <div class="modal fade" id="historico" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Historico</h4>
                </div>
                <div class="modal-body">
                  

                    <div class="panel panel-primary" ng-repeat="x in historico">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                {{x.tipo}}
                            </h4>
                        </div>

                        <div class="panel-body">
                            -Fecha de inicio: {{x.createDate}}<br>
                            <p>Descripción del problema fue {{x.descripcion}}. La puso<strong>{{x.prestatario.nombre}}</strong> </p>
                            -Fecha de resolución:{{x.seResolvio}}<br>
                            <p>¿Cómo se resolvió? {{x.resolucion}}</p>

                        </div>
                    </div>


                </div>
            </div>
        </div>
        <div class="modal-footer">

            <button type="button" class="btn btn-info" data-dismiss="modal" >Cerrar</button>
        </div>
    </div>

</div>
</div>


</div>
