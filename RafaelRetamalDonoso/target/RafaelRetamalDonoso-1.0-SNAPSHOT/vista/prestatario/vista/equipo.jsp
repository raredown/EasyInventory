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
    <div class="col-md-12">
        <div class="panel panel-primary" id="pruebasPdf">
            <div class="panel-heading">Panel equipo </div>
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
                            <td>
                                <a data-toggle="modal" data-target="#pedir" ng-click="elecionEquipo(x.idEquipo)"><span class="glyphicon glyphicon-pencil pull-center glyfmod"></span></a>
                                <a data-toggle="modal" data-target="#historico" ng-click="getHistorico(x.idEquipo)"><span class="glyphicon glyphicon-eye-open glyfmod"></span></a>                               
                            </td>
                        </tr>
                    </tbody>

                </table>

            </div>
            <div class="panel-footer">

            </div>
        </div>
    </div>


    <!--Dialog Pedir-->
    <div class="modal fade" id="pedir" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Pedir Equipo {{modEquipo.idEquipo}}</h4>
                </div>
                <div class="modal-body">
                     <form>
                        <div class="form-group">
                            <label for="Descripcion">Descripción:</label>
                            <textarea class="form-control" rows="5" id="comment" ng-model="newIncidencia.descripcion"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" ng-click="pedirEquipo()">Pedir</button>
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
