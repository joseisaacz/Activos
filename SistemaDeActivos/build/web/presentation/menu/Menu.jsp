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
         <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Sistema de Activos</title>
              
         <%@ include file="/presentation/headerprin.jsp" %>  
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
    </body>
</html>
