<%-- 
    Document   : View
    Created on : 17-May-2019, 19:19:01
    Author     : admin
--%>

<%@page import="SistemaDeActivos.logic.Dependencia"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="SistemaDeActivos.logic.Model"%>
<%@page import="SistemaDeActivos.logic.Funcionario"%>
<!DOCTYPE html>
<html>
    <head>
            
        <title>Registrar Dependencia</title>
         <%@ include file="/presentation/headerprin.jsp" %> 
            <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
         
    
    </head>
   <body>
        <% String editar= (String) request.getSession().getAttribute("editarDependencia"); 
           Dependencia model=(Dependencia) request.getSession().getAttribute("DependenciaFuncionario");
        %>
         <div style="margin-top: 100px"></div>
         <div class="container">
            
         <h3 style="text-align: center">Registrar Dependencia</h3> 
        <div class="jumbotron">
           
        <form method="POST" name="formulario" id="formulario" action="SistemaDeActivos/presentation/create/funcionario">
            
            <div class="row">
                <div class="col">
                    <div class="form-group">
                            <label >Codigo de Dependencia</label>
                            <input type="text" class="form-control" id="id"  name="codigoDependencia" required <% if(model!=null){%> value="<%= model.getId() %>" <%}%>>
                            
                        </div>    
                </div>
                <div class="col">
                    <div class="form-group">
                            <label >Nombre de la Dependencia</label>
                            <input type="text" class="form-control" name="nombreDependencia" id="nombre" required <%if(model != null){ %> value="<%=model.getNombre()%>" <%}%>>
                            
                        </div>    
                </div>
              
            </div>
              <div class="row">
                  <div class="col-sm-4">
                      <div class="form-group">
                      <% List<Funcionario> list= Model.instance().recuperarFuncionarios(); %>
                      <label >Funcionario Administrador de la de Dependencia</label>
                       <select class="form-control" id="combo-box" name="FuncDepen" >
                      <% if(list != null){ %>
                      
                           <%for(Funcionario d : list){ %>
                           <option value="<%= d.getId() %>" <%if(d.getId().equals(model.getFuncionario().getId())){ %> selected <%} %>><%= d.getNombre() %></option>
                           <%} %>
 
                      <% }  else{  %>
                      <option value="Agregar mas tarde">Agregar mas tarde </option>
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
                   
                    <input type="submit" id="submit" class="btn btn-success" value="AGREGAR" > 
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;&nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;&nbsp;
                    &nbsp; &nbsp; &nbsp; &nbsp; 
                   <input type="button" id="cancelar" class="btn btn-danger" value="CANCELAR" onclick="javascript:cleanF();">
                </div>
         
                 
                </div>
            <%}%>
        </form>
             <%if(editar != null){%>
            
                 <div class="col-4 mx-auto">

                 
           
                 <a href="/SitemaDeActivos/presentation/dependencia/delete?codDepen=<%=model.getCodigo() %>" class="btn btn-danger">ELIMINAR</a>
                      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;&nbsp;
                  
                  <a href="/SitemaDeActivos/presentation/funcionario/update?codDepen=<%=model.getCodigo()%>" class="btn btn-success">ACTUALIZAR</a>
      
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
