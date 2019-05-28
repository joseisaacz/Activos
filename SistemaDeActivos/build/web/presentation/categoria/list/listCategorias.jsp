<%-- 
    Document   : listCategorias
    Created on : 18-May-2019, 19:04:26
    Author     : admin
--%>

<%@page import="SistemaDeActivos.logic.Categoria"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Lista de Categorias</title>
    
           <%@ include file="/presentation/headerprin.jsp" %> 
                  <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
    </head>
    <body>
       <%  List<Categoria> categorias = SistemaDeActivos.logic.Model.instance().recuperarCategorias(); %>
        <div style="margin-top: 100px"></div>
        <div class="container">
             <table class="table table-hover">
                         <caption style="caption-side: top; font-size: 35px; text-align: center"><span class="badge badge-pill badge-info">Lista de Categorias</span></caption>
           <thead>
      <tr>
          <th style="text-align: center">Codigo de la categoria</th>
          <th style="text-align: center">Nombre de la categoria</th>
        <th style="text-align: center">Numero consecutivo</th>

     
      </tr>
    </thead>
    
    <tbody id="listado">
        <%
         if(categorias != null){
          if(categorias.size() > 0 ){
          for( Categoria  s:  categorias){ %>
                            <tr>
      <td style="text-align: center"><a href="/SistemaDeActivos/presentation/categoria/consult?idCategoria=<%=s.getCategoria() %>"><%=s.getCategoria() %></a> </td>                     
      <td style="text-align: center"><%= s.getDescripcion() %></td>
      <td style="text-align: center"><%= s.getConsecutivo() %></td>                         
                            </tr>
                    <%} 
                        }
                }
                    %>
    </tbody>
             </table>
            
        
        </div>
        
        
        
          <div >
                         <%@ include file="/presentation/bottomheader.jsp" %>  
                    </div>
                    
                    
                                   <script type="text/javascript" src="css/js/jquery.js"></script>
  <script type="text/javascript" src="css/js/bootstrap.js"></script>
 <script  src="js/ajax.js"></script>     
    </body>
</html>
