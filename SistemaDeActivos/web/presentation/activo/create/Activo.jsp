<%-- 
    Document   : Activo
    Created on : 19-May-2019, 20:42:07
    Author     : admin
--%>

<%@page import="SistemaDeActivos.logic.Categoria"%>
<%@page import="java.util.ArrayList"%>
<%@page import="SistemaDeActivos.logic.Bien"%>
<%@page import="SistemaDeActivos.logic.Bien"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="SistemaDeActivos.logic.Solicitud"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bienes adscritos a la Solicitud</title>
         <%@ include file="/presentation/headerprin.jsp" %> 
          <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
          
    </head>
    <body>
         <div style="margin-top: 100px"></div>
         
         <%
             Solicitud s= (Solicitud) request.getSession().getAttribute("solicitudRegistrador");  %>
         <div class="container">
             
             <form method="POST" name="formulario" id="formulario" action="/SistemaDeActivos/presentation/activo/create/solicitud?numeroSolXAct=<%=s.getNumero()%>">
              <table class="table table-hover">
                         <caption style="caption-side: top; font-size: 35px; text-align: center"><span class="badge badge-pill badge-info">Bienes adscritos a la Solicitud</span></caption>
                <thead>
      <tr>
          <th style="text-align: left">Numero</th>
          <th style="text-align: left">Descripcion</th>
        <th style="text-align: left">Marca</th>
        <th style="text-align: left">Modelo</th>
        <th style="text-align: center">Precio</th>
          <th style="text-align: center">Categoria</th>
      </tr>
    </thead>
    <tbody>
 
           <%  
               List<Categoria> categorias= SistemaDeActivos.logic.Model.instance().recuperarCategorias();
               if(!s.getBiens().isEmpty()){
               for(Bien bien: s.getBiens()){ %>
                            <tr>
      <td style="text-align: left"><%= bien.getNumero() %></td>                          
      <td style="text-align: left"><%= bien.getDescripcion() %></td>
      <td style="text-align: left"><%= bien.getMarca() %></td>
      <td style="text-align: left"><%= bien.getModelo() %></td>
      <td style="text-align: center"><%= bien.getPrecio() %></td>
      <td>
          <select class="form-control" id="combo-box" name="<%= bien.getNumero() %>">
              <option value="Sin Asignar">Sin Asignar</option>
             <% for(Categoria c: categorias) { %>
             <option value="<%= c.getCategoria()%>"><%= c.getDescripcion() %></option>
             <%} %>
          </select>
      </td>
                                    
                            </tr>
                            <%} 
}
                            %>
                  
                
    
    </tbody>
  </table>
             
           
                          <input type="submit" id="submit" class="btn btn-success" value="ACTUALIZAR SOLICITUD" > 
             </form>           
                            <% String error= (String) request.getSession().getAttribute("errorActivo/jsp");
                                if( error!= null) { %>
            
              
        <div class="container">
        <Medium id="Error" class="text-danger">
          <%=error %>
        </Medium>      
      </div>
          <%  request.getSession().setAttribute("errorActivo/jsp", null); } %>
         </div>
        
        
        
            <div >
                         <%@ include file="/presentation/bottomheader.jsp" %>  
                    </div>
   <script type="text/javascript" src="css/js/jquery.js"></script>
  <script type="text/javascript" src="css/js/bootstrap.js"></script>
 <script  src="js/ajax.js"></script>
    </body>
</html>
