<%-- 
    Document   : DetalleActivo
    Created on : 27-May-2019, 22:06:55
    Author     : admin
--%>

<%@page import="SistemaDeActivos.logic.Activo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
           <%@ include file="/presentation/headerprin.jsp" %> 
        <title>Detalle Activo</title>
    </head>
    <body>
         <div style="margin-top: 100px"></div>
        <% Activo model= (Activo)request.getSession().getAttribute("ActivoModel"); %>
     
        <div class="container-fluid">
            <form>
               <div class="row">
                   <div class="col-sm-4">
                       <div class="form-group">
                           <label>Número de Activo</label>
                           <input type="text" value="<%=model!=null?model.getCodigo():"ERROR"%>" class="form-control" readonly>
                       </div>
                       
                   </div>
                       <div class="col-sm-4">
                       <div class="form-group">
                           <label>Categoria</label>
                           <input type="text" value="<%= model!=null ?  model.getCategoria().getDescripcion():"ERROR" %>" class="form-control" readonly>
                       </div>
                       
                   </div>
               </div>
                   <div class="row">
                   <div class="col-sm-4">
                       <div class="form-group">
                           <label>Funcionario Responsable</label>
                           <input type="text" value="<%= model!= null ? model.getFuncionario().getNombre(): "ERROR"%>" class="form-control" readonly>
                       </div>
                       
                   </div>
                       <div class="col-sm-4">
                       <div class="form-group">
                           <label>Puesto del Funcionario Responsable</label>
                           <input type="text" value="<%= model!= null? model.getPuesto(): "ERROR"%>" class="form-control" readonly>
                       </div>
                       
                   </div>
               </div>
                       
                      <div class="row">
                        <div class="col-sm-4 bg-light text-dark">
                            <h3>Informacion del Bien</h3>
                            <div class="col-sm-8">
                                <div class="form-group">
                           <label>Descripcion del Bien</label>
                           <input type="text" value="<%=model!= null? model.getBien()!= null? model.getBien().getDescripcion():"ERROR" : "ERROR"%>" class="form-control" readonly>
                       </div>
                            </div>
                        <div class="col-sm-8">
                                <div class="form-group">
                           <label>Marca</label>
                           <input type="text" value="<%=model!= null? model.getBien()!= null? model.getBien().getMarca():"ERROR" : "ERROR"%>" class="form-control" readonly>
                       </div>
                            </div>
                       <div class="col-sm-8">
                                <div class="form-group">
                           <label>Modelo</label>
                           <input type="text" value="<%=model!= null? model.getBien()!= null? model.getBien().getModelo():"ERROR" : "ERROR"%>" class="form-control" readonly>
                       </div>
                            </div>
                        </div>
                       
                          <div class="col-sm-4">
                                <div class="form-group">
                           <label>Dependencia a la que está asignada</label>
                           <input type="text" value="<%=model!= null ? model.getDependencia() != null ? model.getDependencia().getNombre():"ERROR" :"ERROR"%>" class="form-control" readonly>
                       </div>
                           <div class="form-group">
                                    <label>Código de Barras</label><br>
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  VER CÓDIGO DE BARRAS
</button>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Codigo de Barras</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
          <% String result=model.getCategoria().getDescripcion() + model.getConsecutivo(); %>
        <div style="margin-left: 100px">
                                                    <img id="barcode2"/>
                                                </div>
                                                
                                                <script  src="js/JsBarcode.all.min.js"></script>
                                                <script>
                                                   JsBarcode("#barcode2", "<%=result%>", {
                                                      format:"CODE39",
                                                        displayValue:true,
                                                     fontSize:24,
                                                    lineColor: "#000000",
                                                    width:1
                                                        });
                                                </script>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
      </div>

    </div>
  </div>
</div>

                       </div>
                            </div>
                         <div class="col-sm-4">
                            
                            </div>
                      </div>
                       
                       <div class="row">
                           
                           
                       </div>
                       
                       
            </form>
            
            
            
            
        </div>
        
        
        
             <div >
                         <%@ include file="/presentation/bottomheader.jsp" %>  
                    </div>
                    
                    
                                   <script type="text/javascript" src="css/js/jquery.js"></script>
  <script type="text/javascript" src="css/js/bootstrap.js"></script>
 <script  src="js/ajax.js"></script>   
    </body>
</html>
