<%-- 
    Document   : incidencias
    Created on : 01-jun-2017, 8:40:50
    Author     : rretamal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row">
    <div class="col-md-6 col-md-offset-3">
        <div class="panel panel-primary" id="pruebasPdf">
            <div class="panel-heading">Panel Incidencia <a data-toggle="modal" data-target="#anadir"><span class="glyphicon glyphicon-plus pull-right"></span></a></div>
            <div class="panel-body">


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
