<%-- 
    Document   : Solicitud
    Created on : 24-Mar-2019, 13:16:36
    Author     : admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="SistemaDeActivos.logic.Bien"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
     <%@ include file="/presentation/headerprin.jsp" %>  
    
            
        <title>Solicitud</title>
    </head>
    <body>
        <div style="margin-top: 100px" >
     
        </div>
        
        <div class="container">
         
                    <h2>Solicitud</h2>
                    
                    <form method="POST" name="solicitud" action="/SistemaDeActivos/presentation/solicitud/create/solicitud">
                        <div class="row">
                            <div class="col">
                                
                               <div class="form-group">
                            <label >Numero de Comprobante</label>
                            <input type="text" class="form-control" name="numcomp">
                            
                        </div> 
                            </div>
                            
                            <div class="col">
                                 <div class="form-group">
                            <label >Fecha</label>
                            <input type="date" class="form-control" name="fecha">
                            
                        </div>
                                </div>
                            
                            <div class="col">
                                <div class="form-group">
                            <label >Tipo de Adquisicion</label>
                            <select name="tipo" class="form-control">
                                <option value="Donacion">Donacion</option>
                                 <option value="Compra">Compra</option>
                                
                                
                            </select>
                            
                        </div> 
                                
                            </div>
                               
                            
                        </div>
                            
                        
                        <div class="row">
                           
                          
                            <div class="col-sm-4">
                                <div class="form-group">
                                  <label for="disabledSelect">Estado de Solicitud</label>
                                    <select id="disabledSelect" name="estado" class="form-control" >
                                <option value="Enviado al Sistema">Enviado al Sistema</option>
                                 <option value="En espera de aprobacion">En espera de Aprobacion</option>
                               
                                    </select>
                                </div> 
                            </div>
                           
                          </div>      
       
                        <div class="row">
                            <div class="form-group">
                                    <input type="submit" id="submit" class="btn btn-success" value="OK" >
                                </div>
                        </div>
                        
                       
                       
                      
                    </form>
        
        
        <div class="container">
            <h2>Bien</h2>
            
            <form method="POST" name="bien" id="validateForm" action="presentation/solicitud/create/bien" >
                <div style="padding-left: 50px">
               <div class="row">
                 
                   <div class="col-sm">
                       
                            <input type="text" class="form-control" name="numserie" id="validationDefault22" 
                            aria-describedby="inputGroupPrepend23" required>
                   </div>
                   
                    <div class="col-sm">
                      
                            <input type="text" class="form-control" name="descripcion" required>
                   </div>
                   
                    <div class="col-sm">
                      
                            <input type="text" class="form-control" name="marca" required>
                   </div>
                   
                  
                   <div class="col-sm">
                
                            <input type="text" class="form-control" name="modelo"required>
                   
                       </div>
                    <div class="col-sm">
                      
                            <input type="number" class="form-control" name="precio" required>
                   </div>
                   
                     <div class="col-sm">
                     
                            <input type="number" class="form-control" name="cantidad"required>
                   </div>

               </div>
                </div>   
         
            <div class="row">
                <table class="table table-striped">
                    <% List<Bien> model;
                        if( request.getSession(true).getAttribute("Bienes")!=null){
                        
                        model=(List<Bien>) request.getSession(true).getAttribute("Bienes");
                    }
                    else{
                       model= new ArrayList();  
                    }
                    %>
    <thead>
      <tr>
          <th style="text-align: center">Numero de Serie</th>
        <th style="text-align: center">Descripcion</th>
        <th style="text-align: center">Marca</th>
        <th style="text-align: center">Modelo</th>
        <th style="text-align: center">Precio Unitario</th>
        <th style="text-align: center">Cantidad</th>
      </tr>
    </thead>
    <tbody>
      <% 
          if(model!=null)
          for(Bien b: model){ %>
                            <tr>
       <td style="text-align: center"><%= b.getNumero()%></td>
      <td style="text-align: center"><%= b.getDescripcion()%></td>
      <td style="text-align: center"><%= b.getMarca()%></td>
       <td style="text-align: center"><%= b.getModelo()%></td>
       <td style="text-align: center"><%= b.getPrecio()%></td>
       <td style="text-align: center"><%= b.getCantidad()%></td>
                                    
                            </tr>
                    <% }
                    %>
                
    
    </tbody>
  </table>
            </div>
            
           
            
                <input type="submit" id="submit" class="btn btn-success" value="OK" >
            </form>
        </div>
      
         <div >
                         <%@ include file="/presentation/bottomheader.jsp" %>  
                    </div>
 
    </body>
    
          
<!--

         <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script> 
<script type="text/javascript">
    $(document).ready(function(){
      $('#validateForm').bootstrapValidator({ 
          feedbackIcons: {
	valid: 'glyphicon glyphicon-ok',
	invalid: 'glyphicon glyphicon-remove',
	validating: 'glyphicon glyphicon-refresh'
},
          fields:{
        numserie: {
		validators: {
			notEmpty: {
				message: 'Por favor complete la informacion'
			}
		}
	},
        descripcion: {
		validators: {
			notEmpty: {
				message: 'Por favor complete la informacion'
			}
		}
	},
        marca: {
		validators: {
			notEmpty: {
				message: 'Por favor complete la informacion'
			}
		}
	},
         modelo: {
		validators: {
			notEmpty: {
				message: 'Por favor complete la informacion'
			}
		}
	},
        precio: {
		validators: {
			notEmpty: {
				message: 'Por favor complete la informacion'
			}
		}
	},
        cantidad: {
		validators: {
			notEmpty: {
				message: 'Por favor complete la informacion'
			}
		}
	}
          }
        
        }) ;
    });
    
   
    
    
</script>
 -->
</html>