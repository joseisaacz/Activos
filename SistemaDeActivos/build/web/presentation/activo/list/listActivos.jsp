<%-- 
    Document   : RotularActivo
    Created on : 23-May-2019, 20:02:07
    Author     : admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="SistemaDeActivos.logic.Activo"%>
<%@page import="java.util.List"%>
<%@page import="SistemaDeActivos.logic.Bien"%>
<%@page import="SistemaDeActivos.logic.Solicitud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado de Activos</title>
               <%@ include file="/presentation/headerprin.jsp" %>  
                   <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
    </head>
    <body>
           
        <div style="margin-top: 100px" ></div>
                     <form method="POST" name="formulario" id="formulario" action="/SistemaDeActivos/presentation/activo/list">

        <div class="row">
            
               <div class="col-sm-2">
                <div class="form-group">
                              
                                <input class="form-control" type="text" id="textoActivo" name="textoActivo">
                                   
                </div>    
               </div>
          
                 <div class="col-sm-2">
                <div class="form-group">
                    
                         <select class="form-control" name="criterioActivo">
                             <option value="todos">Todos los Activos</option>
                              <option value="codActivo">Codigo de Activo</option>
                              <option value="dependenciaActivo">Dependencia</option>
                               <option value="funcionarioActivo">Funcionario Responable</option>
                               <option value="categoriaActivo">Categoria</option>
                             
                         </select>
                  
                </div>
                     
                 </div>

                <div class="col-sm-2">
                    <div class="form-group">
                        
                                         <input type="submit" value="BUSCAR" class="btn btn-success">

                    </div>
            
                 </div>
        </div>
 </form> 
            
            
            
      
        <% 
            List<Activo> listaActivos= (List<Activo>) request.getSession().getAttribute("ListaActivos");
        %>
        <table class="table table-hover">
                         <caption style="caption-side: top; font-size: 35px; text-align: center"><span class="badge badge-pill badge-info">Lista de Activos</span></caption>
                         
                          <thead>
      <tr>
          <th style="text-align: center">Numero de Activo</th>
          <th style="text-align: center">Numero de Bien</th>
        <th style="text-align: center">Categoria</th>
         <th style="text-align: center">Consecutivo</th>
          <th style="text-align: center">Funcionario</th>
       <th style="text-align: center">Dependencia</th>
         <th style="text-align: center">Puesto</th>
      </tr>
    </thead>
    <tbody>
        <% if(listaActivos != null){
            if(!listaActivos.isEmpty()){ %>
        
                        
                             <% for(Activo a: listaActivos){ %>
                              <tr>
      <td style="text-align: center"><a href="/SistemaDeActivos/presentation/activo/detalle?numActi=<%=a.getCodigo()%>"><%=a.getCodigo()%></a>  </td>                        
      <td style="text-align: center"><%=a.getBien().getNumero() %></td>
      <td style="text-align: center"><%=a.getCategoria().getDescripcion() %></td>
      <td style="text-align: center"><%=a.getConsecutivo() %></td>
      <td style="text-align: center"><%=a.getFuncionario().getNombre() %></td>
      <td style="text-align: center"><%=a.getDependencia().getNombre() %></td>
      <td style="text-align: center"><%=a.getPuesto() %></td>
                         </tr>
                         <%}%>
                         <% } } %>
    </tbody>
        </table>
        
                   <div >
                         <%@ include file="/presentation/bottomheader.jsp" %>  
                    </div>
                   <script type="text/javascript" src="css/js/jquery.js"></script>
  <script type="text/javascript" src="css/js/bootstrap.js"></script>
 <script  src="js/ajax.js"></script>
    </body>
</html>
