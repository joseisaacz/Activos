<%-- 
    Document   : header
    Created on : 21-Mar-2019, 21:40:49
    Author     : admin
--%>


<%@page import="SistemaDeActivos.logic.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <base href="http://localhost:8080/SistemaDeActivos/">
         <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
        <title>Header</title>
    </head>
    <body>
       
        <div class="container">
             <%   Usuario us;
                                    us= (Usuario)request.getSession(true).getAttribute("logged"); %>
            <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
                <a class="navbar-brand"> <img src="images/logo.png" width="50" hight="50"></a>
               

                <span class="nav-text" style="color: white"> Sistema de Activos</span>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class=" navbar-nav ml-auto">
                    
                                
                    <li class="nav-item">
                        <a class ="nav-link" href="/SistemaDeActivos/presentation/menu/Menu.jsp">Home</a> 
                        </li>
                         <% if(us!=null){ %>  
                         <li class="nav-item dropdown">
                             
                       <a class ="nav-link dropdown-toggle" data-toggle="dropdown" data-target="rol" href="">
                                       <%=us.getRol() %> 
                                       <span class="carot"></span>
                                   </a>  
                        
                         <div class="dropdown-menu dropdown-menu-right" aria-labelledby="rol">
                                    
                                       <a class="dropdown-item" href="/SistemaDeActivos/presentation/solicitud/create/Solicitud.jsp">Crear Solicitud</a> 
<<<<<<< HEAD
                                        <a class="dropdown-item" href="/SistemaDeActivos/presentation/solicitud/list/list.jsp">Ver Solicitudes</a> 
=======
                                       <a class="dropdown-item" href="/SistemaDeActivos/presentation/solicitud/list">Ver Solicitudes</a> 
>>>>>>> d34915252060bf0b282661c260f41aab46066283
                                     
                                   </div>
                        
                        
                        </li>
                        <%}%>
                        
                      
                           <li class="nav-item dropdown">
                          <%if(us!=null && us.getFuncionario()!= null) { %>
                           
                                   <a class ="nav-link dropdown-toggle" data-toggle="dropdown" data-target="logout" href="">
                                       <%=us.getFuncionario().getNombre() %> 
                                       <span class="carot"></span>
                                   </a>  
                                 <div class="dropdown-menu dropdown-menu-right" aria-labelledby="logout">
                                    
                                       <a class="dropdown-item" href="/SistemaDeActivos/presentation/usuarios/login/logout">LogOut</a> 
                                     
                                   </div>
                                   <%} 
                                    else{
                                   %>
                                    <a class ="nav-link" href="/SistemaDeActivos/presentation/usuarios/login/prepareLogin">Login<a/> 
                                        <%}%>
                        </li>
                </ul>
                    </div>
            </nav>
                        
        </div>
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    </body>
</html>