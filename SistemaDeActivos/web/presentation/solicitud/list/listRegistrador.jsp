<%-- 
    Document   : listRegistrador
    Created on : 23-May-2019, 20:04:35
    Author     : admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="SistemaDeActivos.logic.Solicitud"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
          <title> Lista de Solicitudes en espera de rotulacion</title>
        <%@ include file="/presentation/headerprin.jsp" %>  
                   <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
    </head>
    <body>
        <div style="margin-top: 100px" ></div>
        <% 
           
          List<Solicitud> model= SistemaDeActivos.logic.Model.instance().recuperarSolicitudRegistradorV2(us.getFuncionario()); 
                             
               %>
                           
       <table class="table table-hover">
                         <caption style="caption-side: top; font-size: 35px; text-align: center"><span class="badge badge-pill badge-info">Lista de Solicitudes en espera de rotulacion</span></caption>             
                   
    <thead>
      <tr>
          <th style="text-align: left">Numero de Solicitud</th>
          <th style="text-align: left">Numero de Comprobante</th>
        <th style="text-align: left">Fecha</th>
        <th style="text-align: left">Tipo</th>
        <th style="text-align: center">Estado</th>
     
      </tr>
    </thead>
    <tbody>
      <% 
          if(model.size()!=0 )
          for(Solicitud s: model){ %>
                            <tr>
      <td style="text-align: left"><a href="/SistemaDeActivos/presentation/activo/rotular/sol?numeroSolRo=<%=s.getNumero()%>"</a><%=s.getNumero()%></td>                          
      <td style="text-align: left"><%= s.getComprobante() %></td>
      <td style="text-align: left"><%= date(s.getFecha()) %></td>
      <td style="text-align: left"><%= s.getTipo() %></td>
      <td style="text-align: center"><%= s.getEstado() %></td>
     
                                    
                            </tr>
                    <% }
                    %>
                
    
    </tbody>
  </table>
                    <div >
                         <%@ include file="/presentation/bottomheader.jsp" %>  
                    </div>
                   <script type="text/javascript" src="css/js/jquery.js"></script>
  <script type="text/javascript" src="css/js/bootstrap.js"></script>
 <script  src="js/ajax.js"></script>
 
 <%!String date(Date fecha){
    
    return new SimpleDateFormat("dd/MM/yyyy").format(fecha);
  
}

%>
    </body>
</html>
