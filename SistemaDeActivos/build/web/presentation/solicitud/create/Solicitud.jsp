<%-- 
    Document   : Solicitud
    Created on : 24-Mar-2019, 13:16:36
    Author     : admin
--%>

<%@page import="SistemaDeActivos.logic.Solicitud"%>
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
          <title>Solicitud</title>
        <%@ include file="/presentation/headerprin.jsp" %>  
    
            
 
    </head>
    <body>
       
        <div style="margin-top: 100px" >
     
        </div>
        
        <div class="container">
         
                    <h2>Solicitud</h2>
                    
                    <form method="POST" name="solicitud" action="/SistemaDeActivos/presentation/solicitud/create/solicitud">
                        <% Solicitud sol=(Solicitud) request.getAttribute("modelSolicitud");%>
                        <div class="row">
                            <div class="col">
                                
                               <div class="form-group">
                            <label >Numero de Comprobante</label>
                            <input type="text" class="form-control" name="numcomp"  <% if(sol!=null){ %> value="<%=sol.getComprobante()%>"<%} %> required>
                            
                        </div> 
                            </div>
                            
                            <div class="col">
                                 <div class="form-group">
                            <label >Fecha</label>
                            <% String date=(String)request.getAttribute("date"); %>
                            <input type="date" class="form-control" name="fecha" required value="<%= date!=null ? date: null %>">
                            
                        </div>
                                </div>
                            
                            <div class="col">
                                <div class="form-group">
                            <label >Tipo de Adquisicion</label>
                            <select name="tipo" class="form-control" required >
                                <option value="Donacion"<% if(sol!=null && sol.getTipo().equals("Donacion")){%> selected<% } %> >Donacion</option>
                                 <option value="Compra"<% if(sol!=null && sol.getTipo().equals("Compra")){ %> selected <% } %>  > Compra</option>
                                
                                
                            </select>
                            
                        </div> 
                                
                            </div>
                               
                            
                        </div>
                            
                        
                        <div class="row">
                           
                          
                            <div class="col-sm-4">
                                <div class="form-group">
                                  <label for="disabledSelect">Estado de Solicitud</label>
                                    <select id="disabledSelect" name="estado" class="form-control" required <% if(sol!=null){ %>value="<%=sol.getEstado()%>"<%} %>>
                                <option value="Enviado al Sistema">Enviado al Sistema</option>
                                 <option value="En espera de aprobacion">En espera de Aprobacion</option>
                               
                                    </select>
                                </div> 
                            </div>
                           
                          </div>      
       
 
                            <div class="col-sm-4">
                                <%String errorSolicitud=(String)request.getAttribute("errorSolicitud"); %>
                                <% if(errorSolicitud!=null){%>
                                <div class="container">
                       <Medium id="Error" class="text-danger">
                       <%=errorSolicitud %>
                      </Medium>      
                       </div>
                       <div style="padding-top: 10px">
                         </div>
                             <%  } %>
                                    <input type="submit" id="submit" class="btn btn-success" value="AGREGAR SOLICITUD" >
                                </div>
                       
                        
                       
                       
                      
                    </form>
               </div>
                                    <div style="padding-top: 30px"></div>
        <div class="container rounded bg-light text-dark">
             <h2>Bien</h2>
 <form method="POST" name="bien" id="validateForm" action="presentation/solicitud/create/bien" >
   
               <div class="row">
                 
                   <div class="col-sm">
                       <label for="numserie">Numero de Serie</label>
                            <input type="text" class="form-control" name="numserie" id="numserie" 
                            aria-describedby="inputGroupPrepend23" required>
                   </div>
                   
                    <div class="col-sm">
                                 <label for="descripcion" >Descripcion</label>
                            <input type="text" class="form-control" name="descripcion" id="descripcion" required>
                   </div>
                   
                    <div class="col-sm">
                      <label style="text-align: right" > Marca</label>
                            <input type="text" class="form-control" name="marca" required>
                   </div>
                   
                  
                   <div class="col-sm">
                  <label style="text-align: right" >Modelo</label>
                            <input type="text" class="form-control" name="modelo"required>
                   
                       </div>
                    <div class="col-sm">
                      <label style="text-align: right" >Precio</label>
                            <input type="number" class="form-control" name="precio" required>
                   </div>
                   
                     <div class="col-sm">
                       <label style="text-align: right" >Cantidad</label>
                            <input type="number" class="form-control" name="cantidad"required>
                   </div>

               </div>
     <div style="padding-bottom: 30px">
                    </div>
     <div class="col-sm">
                  <input type="submit" id="submit" class="btn btn-success" value="AGREGAR BIEN" >
     </div>
  
               </form>
</div>

                    <div style="padding-bottom: 30px">
                    </div>
        <div class="container">
           
            
           
         
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
        <th style="text-align: center">Eliminar</th>
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
       <td style="text-align: center">
           <a href="/SistemaDeActivos/presentation/solicitud/delete/bien?numserie=<%=b.getNumero()%>"><img style=" width: 10px; height:10px "src="images/delete.png"/></a></td>



                            
                            </tr>
                    <% }
                    %>
                
    
    </tbody>
  </table>
            </div>
            
           
            
          
  
        </div>
      
                    
         <div style="padding-top: 100px" >
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
