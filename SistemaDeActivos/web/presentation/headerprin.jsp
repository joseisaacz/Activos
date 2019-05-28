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
      <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         
     
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
                         
                         
                         <%if(us.getRol().equals("Administrador") || us.getRol().equals("Secretaria OCCB") || us.getRol().equals("Jefe OCCB") ||
                                 us.getRol().equals("Registrador")){ %>
                         <li class="nav-item dropdown">
                             
                       <a class ="nav-link dropdown-toggle" data-toggle="dropdown" data-target="Solicitud" href="">
                                     Solicitud
                                       <span class="carot"></span>
                                   </a>  
                        
                         <div class="dropdown-menu dropdown-menu-right" aria-labelledby="Solicitud">
                             <%if(us.getRol().equals("Administrador")){ %>
                                       <a class="dropdown-item" href="/SistemaDeActivos/presentation/solicitud/create/Solicitud.jsp">Crear Solicitud</a> 
                                                <%}%>
                                       <!-- <a class="dropdown-item" href="/SistemaDeActivos/presentation/solicitud/list/list.jsp">Ver Solicitudes</a> -->

                                       <a class="dropdown-item" href="/SistemaDeActivos/presentation/solicitud/list">Ver Solicitudes</a> 
                                       
                            <%if(us.getRol().equals("Registrador")){ %>
                                         <a class="dropdown-item" href="/SistemaDeActivos/presentation/solicitud/list/listRegistrador.jsp">Ver Solicitudes en espera de Rotulacion</a> 
                                     <% } %>
                                   </div>
                        
                        
                        </li>
                        <%} %>
                         <% if( us.getRol().equals("Jefe RRHH")){ %> 
                        <li class="nav-item dropdown">
                            <a class ="nav-link dropdown-toggle" data-toggle="dropdown" data-target="Dependencia" href="">
                                     Dependencia
                                       <span class="carot"></span>
                                   </a>  
                        
                         <div class="dropdown-menu dropdown-menu-right" aria-labelledby="Dependencia">
                                    
                                       <a class="dropdown-item" href="/SistemaDeActivos/presentation/dependencia/create/Dependencia.jsp">Crear Dependencia</a> 

                                       <!-- <a class="dropdown-item" href="/SistemaDeActivos/presentation/solicitud/list/list.jsp">Ver Solicitudes</a> -->

                                       <a class="dropdown-item" href="/SistemaDeActivos/presentation/dependencia/list/listDependencias.jsp">Ver Dependencias</a> 
                                       
                            

                                     
                                   </div>
                        </li>
                        <% } %>
                        <% if(us.getRol().equals("Jefe OCCB")|| us.getRol().equals("Jefe RRHH")){ %>
                        
                        
                          <li class="nav-item dropdown">
                            <a class ="nav-link dropdown-toggle" data-toggle="dropdown" data-target="Activos" href="">
                                     Activos
                                       <span class="carot"></span>
                                   </a>  
                        
                         <div class="dropdown-menu dropdown-menu-right" aria-labelledby="Activos">
                                    
                                       <a class="dropdown-item" href="/SistemaDeActivos/presentation/activo/list/listActivos.jsp">Ver Activos</a> 


                                   </div>
                        </li>
                        
                        
                        
                        <%}%>
                        <%if(us.getRol().equals("Jefe RRHH")){ %>
                          <li class="nav-item dropdown">
                            <a class ="nav-link dropdown-toggle" data-toggle="dropdown" data-target="Categoria" href="">
                                     Categoria
                                       <span class="carot"></span>
                                   </a>  
                        
                         <div class="dropdown-menu dropdown-menu-right" aria-labelledby="Categoria">
                                    
                                       <a class="dropdown-item" href="/SistemaDeActivos/presentation/categoria/create/Categoria.jsp">Crear Categoria</a> 

                                       <!-- <a class="dropdown-item" href="/SistemaDeActivos/presentation/solicitud/list/list.jsp">Ver Solicitudes</a> -->

                                       <a class="dropdown-item" href="/SistemaDeActivos/presentation/categoria/list/listCategorias.jsp">Ver Categorias</a> 
                                       
                            

                                     
                                   </div>
                        </li>
                   
                         <li class="nav-item dropdown">
                            <a class ="nav-link dropdown-toggle" data-toggle="dropdown" data-target="Funcionario" href="">
                                     Funcionario
                                       <span class="carot"></span>
                                   </a>  
                        
                         <div class="dropdown-menu dropdown-menu-right" aria-labelledby="Funcionario">
                                    
                                       <a class="dropdown-item" href="/SistemaDeActivos/presentation/funcionario/create/Funcionario.jsp">Crear Funcionario</a> 

                                       <!-- <a class="dropdown-item" href="/SistemaDeActivos/presentation/solicitud/list/list.jsp">Ver Solicitudes</a> -->

                                       <a class="dropdown-item" href="/SistemaDeActivos/presentation/funcionario/list/listFuncionarios.jsp">Ver Funcionarios</a> 
                                       
                            

                                     
                                   </div>
                        </li>
                             <%}%>
                       
                        <%}%>
                        
                      
                           <li class="nav-item dropdown">
                          <%if(us!=null && us.getFuncionario()!= null) { 
                        
                          %>
                           
                                   <a class ="nav-link dropdown-toggle" data-toggle="dropdown" data-target="logout" href="">
                                       <%=us.getRol() %> 
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
   <script type="text/javascript" src="css/js/jquery.js"></script>
  <script type="text/javascript" src="css/js/bootstrap.js"></script>
    </body>
</html>