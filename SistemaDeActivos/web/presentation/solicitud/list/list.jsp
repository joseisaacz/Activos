<%-- 
    Document   : list
    Created on : 23-Mar-2019, 19:00:12
    Author     : admin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="SistemaDeActivos.logic.Solicitud"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/estilo.css">
        <title>Lista de Solicitudes</title>
        <%@ include file="/presentation/headerprin.jsp" %>  
    </head>
    <body>
        
        <div style="margin-top: 100px" >
     
        </div>
       
                    <table class="table table-hover">
                         <caption style="caption-side: top; font-size: 35px; text-align: center"><span class="badge badge-pill badge-info">Lista de Solicitudes</span></caption>
                    <% List<Solicitud> model= SistemaDeActivos.logic.Model.instance().recuperarSolicitudes(); %>
                           
                    
                   
    <thead>
      <tr>
          <th style="text-align: left">Numero de Comprobante</th>
        <th style="text-align: left">Fecha</th>
        <th style="text-align: left">Tipo</th>
        <th style="text-align: center">Cantidad de bienes</th>
        <th style="text-align: center">Estado</th>
     
      </tr>
    </thead>
    <tbody>
      <% 
          if(model.size()!=0 )
          for(Solicitud s: model){ %>
                            <tr>
       <td style="text-align: left"><%= s.getComprobante() %></td>
       <td style="text-align: left"><%= date(s.getFecha()) %></td>
      <td style="text-align: left"><%= s.getTipo() %></td>
      <td style="text-align: center"><%= s.getBiens().size() %></td>
      <td style="text-align: center"><%= s.getEstado() %></td>
     
                                    
                            </tr>
                    <% }
                    %>
                
    
    </tbody>
  </table>
                    <div >
                         <%@ include file="/presentation/bottomheader.jsp" %>  
                    </div>
      
    </body>
</html>
<%!String date(Date fecha){
    
    return new SimpleDateFormat("dd/MM/yyyy").format(fecha);
  
}

%>