<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="SistemaDeActivos.logic.Usuario"%>
<!DOCTYPE html>
<html>
<head>
            <base href="http://localhost:8080/SistemaDeActivos/" > 
            
         <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="css/estilo.css">
    <title>Login</title>
    <%@ include file="/presentation/headerprin.jsp" %>
</head>

<body>
 
<%@ include file="/presentation/Header.jsp" %>
<% Usuario model= (Usuario) request.getAttribute("model"); %>
<% Boolean error = (Boolean) request.getAttribute("errorBase"); %>        

       
 <div style="margin-top: 100px" >
     
        </div>
<div class="jumbotron boxlogin">
  <h2 style="text-align: center; position:relative; top:-25px;"  ><span class="badge badge-dark">Login</span></h2>
    
    <form method="POST" name="login" action="presentation/usuarios/login/login">
        
   
           <div class="form-group"> 
               <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
               <label>Username</label>
              <input type="text" name="id" class="form-control"  required>
            
        </div>
         
        <div class="form-group">
            
            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
              <label>Password</label>
      <input type="password" name="clave" class="form-control" 
                            required>
           
        </div>

    <% if( error!= null && error.booleanValue()) { %>
            
              
        <div class="container">
        <Medium id="Error" class="text-danger">
          Error! Datos ingresados son invalidos
        </Medium>      
      </div>
    <div style="padding-top: 10px">
    </div>
       <% } %>
      <div class="form-group"> 
      <input type="submit" class="btn btn-success" value="OK">   
      </div> 
        

       
        

      
        
        
        
    </form>
    
    
    
</div>

</body>
</html>
<%!
    private String validity(String field, Map<String,String> errors){
      if ( (errors!=null) && (errors.get(field)!=null) )
        return "is-invalid";
      else
        return "";
    }

    private String value(String field, Map<String,String[]> values){
        return values.get(field)[0];
    }

    private Map<String,String[]> getValues(Usuario model){
       Map<String,String[]> values = new HashMap<>();
       values.put("id", new String[]{model.getId()});
       values.put("clave", new String[]{model.getClave()});
       return values;
    } 

   %>