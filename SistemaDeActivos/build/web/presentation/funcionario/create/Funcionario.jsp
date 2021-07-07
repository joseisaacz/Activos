<%-- 
    Document   : Funcionario
    Created on : 18-May-2019, 16:55:20
    Author     : admin
--%>

<%@page import="SistemaDeActivos.logic.Funcionario"%>
<%@page import="SistemaDeActivos.logic.Dependencia"%>
<%@page import="SistemaDeActivos.logic.Model"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
   
        <%@ include file="/presentation/headerprin.jsp" %> 
        <title>Registrar Funcionario</title>
    </head>
    <body>
        <% String editar= (String) request.getSession().getAttribute("editarFuncionario"); 
           Funcionario model=(Funcionario) request.getSession().getAttribute("modelFuncionario");
        %>
         <div style="margin-top: 100px"></div>
         <div class="container">
            
         <h3 style="text-align: center">Registrar Funcionario</h3> 
        <div class="jumbotron">
           
        <form method="POST" name="formulario" id="formulario" action=" <%=model==null? "/SistemaDeActivos/presentation/create/funcionario":"/SistemaDeActivos/presentation/funcionario/update?numFun="+model.getId()%>">
            
            <div class="row">
                <div class="col">
                    <div class="form-group">
                            <label >ID de Funcionario</label>
                            <input type="text" class="form-control" id="id"  name="idFuncionario" required <% if(model!=null){%> value="<%= model.getId() %>"disabled <%}%>>
                            
                        </div>    
                </div>
                <div class="col">
                    <div class="form-group">
                            <label >Nombre</label>
                            <input type="text" class="form-control" name="nombreFuncionario" id="nombre" required <%if(model != null){ %> value="<%=model.getNombre()%>" <%}%>>
                            
                        </div>    
                </div>
              
            </div>
              <div class="row">
                  <div class="col-sm-4">
                      <div class="form-group">
                      <% List<Dependencia> list= Model.instance().recuperarDependencias(); %>
                      <label >Dependencia a la que pertenece</label>
                       <select class="form-control" id="combo-box" name="dependenciaFun" >
                      <% if(list != null){ %>
                      
                           <%for(Dependencia d : list){ %>
                           <option value="<%= d.getCodigo() %>" <%if(model!=null && model.getDependencia()!=null) if(d.getCodigo()==model.getDependencia().getCodigo()){ %> selected <%} %>><%= d.getNombre() %></option>
                           <%} %>
 
                      <% }  else{  %>
                      <option value="Agregue una Dependencia">Agregue una Dependencia </option>
                      <% } %>
                   </select> 
                      </div>
                  </div>
                </div>
             <div style="margin-top: 50px"></div>
             <% if(model == null){ %>
            <div class="row">
                 <div style="margin-left: 250px"></div>
                <div class="col">
                   
                  <input type="submit" id="submit" class="btn btn-success" value="AGREGAR">
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;&nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;&nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; 
                   <input type="button" id="cancelar" class="btn btn-danger" value="CANCELAR" onclick="javascript:cleanF();">
                </div>
         
                 
                </div>
            <%}
                else{%>
                <div>
                    <input type="submit" id="submit" class="btn btn-success" value="ACTUALIZAR">
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;&nbsp;
                      <a href="/SistemaDeActivos/presentation/funcionario/delete?idFunc=<%=model.getId()%>" class="btn btn-danger">ELIMINAR</a>
                   </div>
            <%}%>
        </form>
             <%if(editar != null){%>
            
                 <div class="col-4 mx-auto">

                 
           
               
                    
                  
                  
      
                 </div>
               
             
            <% } %>     
        </div>
             </div>
             <% String error= (String) request.getSession().getAttribute("errorFuncionario");
                                if( error!= null) { %>
            
              
        <div class="container">
        <Medium id="Error" class="text-danger">
          <%=error %>
        </Medium>      
      </div>
          <%  request.getSession().setAttribute("errorFuncionario", null); } %>
         <div >
                         <%@ include file="/presentation/bottomheader.jsp" %>  
                    </div>
         <script  src="css/js/jquery.js"></script>
         <script  src="css/js/bootstrap.js"></script>
 <script  src="js/ajax.js"></script>
 
  <%  request.getSession().setAttribute("editarFuncionario",null);
      request.getSession().setAttribute("modelFuncionario",null);  
  %>
    </body>
</html>
