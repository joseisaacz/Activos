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
        <link rel="stylesheet" href="css/estilo.css">
        <title>Lista de Solicitudes</title>
        <%@ include file="/presentation/headerprin.jsp" %>  
                   <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
    </head>
    <body>
        
        <div style="margin-top: 100px" >
     
        </div>
       
                    <table class="table table-hover"id="solTable">
                         <caption style="caption-side: top; font-size: 35px; text-align: center"><span class="badge badge-pill badge-info">Lista de Solicitudes</span></caption>
                         <% Usuario a= (Usuario) request.getSession(true).getAttribute("logged");
                         List<Solicitud> model= null;
                         if(a.getRol().equals("Registrador")){
                          model= SistemaDeActivos.logic.Model.instance().recuperarSolicitudRegistrador(a.getFuncionario());
                         }
                         else
                             if(a.getRol().equals("Administrador")){
                                       int depen = a.getFuncionario().getDependencia().getCodigo();
                                      model= SistemaDeActivos.logic.Model.instance().recuperarSolicitudAdministrador(depen); 
                             }
                             else if(a.getRol().equals("Jefe OCCB")){
                                 model= SistemaDeActivos.logic.Model.instance().recuperarSolicitudJefe();
                             }
                             else if(a.getRol().equals("Secretaria OCCB")){ 
                             
                                 model= (List<Solicitud>)request.getSession().getAttribute("solicitudesSecretaria"); 
                         %>
                                 
                             
                                  <form method="POST" name="formulario" id="formulario" action="/SistemaDeActivos/presentation/solicitud/list/secretaria">

        <div class="row">
            
               <div class="col-sm-2">
                <div class="form-group">
                              
                                <input class="form-control" type="text" id="textoSolicitud" name="textoSolicitud">
                                   
                </div>    
               </div>
          
                 <div class="col-sm-2">
                <div class="form-group">
                    
                         <select class="form-control" name="criterioSolicitud">
                             <option value="todasSol">Todos las Solicitudes</option>
                              <option value="numSol">Numero de Solicitud</option>
                              <option value="solRechazada">Solicitudes Rechazadas</option>
                              <option value="solVerificar">Solicitudes Por Verificar</option>
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
           
                           <%  }
               %>
                           
                    
                   
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
          if(model != null){
          if(model.size()!=0 ){
          for(Solicitud s: model){ %>
                            <tr>
                                <td style="text-align: left"><a href=<%if(a.getRol().equals("Registrador")){ %> "/SistemaDeActivos/presentation/solicitud/consultRegistrador?numero=<%=s.getNumero()%>"  <%} else{if(s.getEstado().equals("Enviado al Sistema")){ %>"/SistemaDeActivos/presentation/solicitud/consult?numero=<%=s.getNumero()%>" <% }else{%> "/SistemaDeActivos/presentation/solicitud/consultonly?numero=<%=s.getNumero()%>" <% }} %>><%= s.getNumero() %></a></td>                          
      <td style="text-align: left"><%= s.getComprobante() %></td>
      <td style="text-align: left"><%= date(s.getFecha()) %></td>
      <td style="text-align: left"><%= s.getTipo() %></td>
      <td style="text-align: center"><%= s.getEstado() %></td>
     
                                    
                            </tr>
                    <%} 
                        }
                }
                    %>
                
    
    </tbody>
  </table>
                    <div >
                         <%@ include file="/presentation/bottomheader.jsp" %>  
                    </div>
                   <script type="text/javascript" src="css/js/jquery.js"></script>
  <script type="text/javascript" src="css/js/bootstrap.js"></script>
 <script  src="js/ajax.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script> 
    <%if(!us.getRol().equals("Secretaria OCCB")){%>
     <script>
     $(document).ready(function() {
              $('#solTable').DataTable( {
        scrollY:        200,
        scrollCollapse: true,
        paging:         false,
        info: false
    } );
} );
</script>
<%}%>
    </body>
</html>
<%!String date(Date fecha){
    
    return new SimpleDateFormat("dd/MM/yyyy").format(fecha);
  
}

%>