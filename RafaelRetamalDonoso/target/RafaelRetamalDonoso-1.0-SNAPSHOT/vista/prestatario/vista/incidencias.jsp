<%-- 
    Document   : incidencias
    Created on : 01-jun-2017, 8:40:50
    Author     : rretamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row">
    <div class="col-md-12">
        <div class="panel panel-primary" >
            <div class="panel-heading" id="panelEquipo">Panel Incidencia </div>
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

                        </tr>
                    </tbody>

                </table>

            </div>
            <div class="panel-footer">

            </div>
        </div>
    </div>


</div>
