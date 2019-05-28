<%-- 
    Document   : listDendencias
    Created on : 18-May-2019, 15:53:23
    Author     : admin
--%>

<%@page import="SistemaDeActivos.logic.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="SistemaDeActivos.logic.Dependencia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Lista de Dependencias</title>
      <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
           <%@ include file="/presentation/headerprin.jsp" %> 
    </head>
    <body>
   <%  List<Dependencia> dependencias = SistemaDeActivos.logic.Model.instance().recuperarDependencias(); %>
        <div style="margin-top: 100px"></div>
        <div class="container">
             <table class="table table-hover">
                         <caption style="caption-side: top; font-size: 35px; text-align: center"><span class="badge badge-pill badge-info">Lista de Funcionarios</span></caption>
           <thead>
      <tr>
          <th style="text-align: center">Codigo</th>
          <th style="text-align: center">Nombre</th>
        <th style="text-align: center">Funcionario Administrador</th>

     
      </tr>
    </thead>
    
    <tbody id="listado">
        <%
         if(dependencias != null){
          if(dependencias.size() > 0 ){
          for( Dependencia  s:  dependencias){ %>
                            <tr>
      <td style="text-align: center"><a href="/SistemaDeActivos/presentation/funcionario/consult?codDepen=<%=s.getCodigo() %>"><%=s.getCodigo() %></a> </td>                     
      <td style="text-align: center"><%= s.getNombre() %></td>
      <td style="text-align: center"><%= s.getFuncionario()!=null?s.getFuncionario().getNombre() :"No Asignado"  %></td>                         
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
