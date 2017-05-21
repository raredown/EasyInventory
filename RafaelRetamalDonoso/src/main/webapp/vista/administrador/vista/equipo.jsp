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
            <div class="panel-heading">Panel Heading <a data-toggle="modal" data-target="#anadir"><span class="glyphicon glyphicon-plus pull-right"></span></a></div>
            <div class="panel-body">Panel Content</div>
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
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
          <p>Some text in the modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</div>
