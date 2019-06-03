<%-- 
    Document   : listFuncionarios
    Created on : 18-May-2019, 18:19:49
    Author     : admin
--%>

<%@page import="SistemaDeActivos.logic.Funcionario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Funcionarios</title>
    
           <%@ include file="/presentation/headerprin.jsp" %> 
             <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
    </head>
    <body>
        <% List<Funcionario> funcionarios = SistemaDeActivos.logic.Model.instance().recuperarFuncionarios(); %>
        <div style="margin-top: 75px"></div>
        <div class="container">
             <table class="table table-striped table-bordered" id="funTable">
                         <caption style="caption-side: top; font-size: 35px; text-align: center"><span class="badge badge-pill badge-info">Lista de Funcionarios</span></caption>
           <thead>
      <tr>
          <th style="text-align: center">ID</th>
          <th style="text-align: center">Nombre</th>
        <th style="text-align: center">Dependencia</th>

     
      </tr>
    </thead>
    
    <tbody id="listado">
        <%
         if(funcionarios != null){
          if(funcionarios.size() > 0 ){
          for( Funcionario s: funcionarios){ %>
                            <tr>
      <td style="text-align: center"><a href="/SistemaDeActivos/presentation/funcionario/consult?idFunc=<%=s.getId()%>"><%=s.getId() %></a> </td>                     
      <td style="text-align: center"><%= s.getNombre() %></td>
      <td style="text-align: center"><%= s.getDependencia().getNombre() %></td>                         
                            </tr>
                    <%} 
                        }
                }
                    %>
    </tbody>
             </table>
            
        
        </div>
        
        
        
          <div  style="padding-bottom: 50px">
                         <%@ include file="/presentation/bottomheader.jsp" %>  
                    </div>
                    
                    
                                   <script type="text/javascript" src="css/js/jquery.js"></script>
                                
                                   <script src="js/jquery.dataTables.min.js"></script>
                                   <script src="js/dataTables.bootstrap4.min.js"></script>
  <script type="text/javascript" src="css/js/bootstrap.js"></script>
 <script  src="js/ajax.js"></script>  
 <script>
     $(document).ready(function() {
              $('#funTable').DataTable( {
        scrollY:        200,
        scrollCollapse: true,
        paging:         false,
        info: false
    } );
} );
     </script>
                    
    </body>
</html>
