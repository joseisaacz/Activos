<%-- 
    Document   : Menu
    Created on : 24-Mar-2019, 15:31:13
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <base href="http://localhost:8080/SistemaDeActivos/">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Sistema de Activos</title>
              
         <%@ include file="/presentation/headerprin.jsp" %> 
                  <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
    </head>
    <body>
        <div style="margin-top: 100px">
            
             </div>
        <div style="margin-bottom: 250px"></div>
        <span class="border">
            
              <div class="container h-100 ">
  <div class="row h-100 justify-content-center align-items-center">
     <div class="panel panel-info">
     <div class="panel-heading bg-light">
    <h3 class="panel-title bg-light ">Bienvenido al Sistema Gestor de Activos</h3>
     </div>
      <div class="panel-body bg-light">
          <br>
         
          <p >
           Este Sistema permite la gestion de activos.
           
           <br>
           Por favor inicie sesion
          </p>
    </div>
</div>
  </div>
</div>
        </span>
      
        
       
        
     <div >
                         <%@ include file="/presentation/bottomheader.jsp" %>  
                    </div>
                    
                                   <script type="text/javascript" src="css/js/jquery.js"></script>
  <script type="text/javascript" src="css/js/bootstrap.js"></script>
 <script  src="js/ajax.js"></script>      
    </body>
</html>
