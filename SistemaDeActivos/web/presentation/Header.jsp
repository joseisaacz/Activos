<%@ page errorPage="/presentation/Error.jsp"%>

<%@page import="SistemaDeActivos.logic.Usuario"%>
<% Usuario logged= (Usuario) session.getAttribute("logged");%>   
<div class="card" style="height: 50px; width: 50%; background-color: whitesmoke; ">
    <ul class="menu">
    <% if(logged!=null){ %>
        <% if(logged.getRol().equals("ADM")){ %>        
             <li> <a href="presentation/personas/create/View.jsp">Registro</a> </li>    
        <% } %>
             
        <% if(logged.getRol().equals("ADM") || logged.getRol().equals("CLI")){ %>         
            <li> <a href="presentation/personas/list">Listado</a> </li>
        <% } %>             

        <li class="submenu"> <a href="#"> <%=logged.getId()%> </a> 
            <ul>
                <li> <a href="presentation/usuarios/login/logout">Log out</a> </li> 
           </ul>             
        </li>
    <% } %>
    
    <% if(logged==null){ %>
        <li> <a href="presentation/usuarios/login/prepareLogin">Ingresar</a> </li>
    <% } %>    
    
   </ul>
</div>