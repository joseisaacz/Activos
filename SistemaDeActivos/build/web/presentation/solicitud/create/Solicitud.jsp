<%-- 
    Document   : Solicitud
    Created on : 24-Mar-2019, 13:16:36
    Author     : admin
--%>

<%@page import="SistemaDeActivos.logic.Funcionario"%>
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

          <title>Solicitud</title>
        <%@ include file="/presentation/headerprin.jsp" %>  
                          <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
    
            
 
    </head>
    <body>
       
        <div style="margin-top: 100px" >
     
        </div>
        
        <div class="container">
                    <%                String edit=(String)request.getSession().getAttribute("editar"); %>
                    <h2>Solicitud</h2>
                    
                    <form method="POST" name="solicitud" action=<% if(us.getRol().equals("Administrador")){ %>"/SistemaDeActivos/presentation/solicitud/create/solicitud" <%}
                       else if(us.getRol().equals("Secretaria OCCB")){
                          %> 
                          "/SistemaDeActivos/presentation/solicitud/create/updatesolicitud" <%} else if(us.getRol().equals("Jefe OCCB")){%>
                           "/SistemaDeActivos/presentation/solicitud/create/updatesolicitudJefe"<%}%>>
                   
                          

                        
                        <% Solicitud sol=(Solicitud) request.getSession().getAttribute("modelSolicitud");
                        System.out.println("Hola");
                        %>
                        <div class="row">
                            
                         
                            <div class="col">
                                
                               <div class="form-group">
                            <label >Numero de Comprobante</label>
                            <input type="text" class="form-control" name="numcomp"  <% if(sol!=null){ %> value="<%=sol.getComprobante()%>"  disabled<%} %> required>
                            
                        </div> 
                            </div>
                            
                            <div class="col">
                                 <div class="form-group">
                            <label >Fecha</label>
                            <% String date=(String)request.getSession().getAttribute("date"); %>
                            <input type="date" class="form-control" name="fecha" required  <% if(sol!=null){ %> value="<%=sol.getFecha()%>"  disabled<%} %> > <!--value="<%= date!=null ? date: null %>"-->
                            
                        </div>
                                </div>
                            
                            <div class="col">
                                <div class="form-group">
                            <label >Tipo de Adquisicion</label>
                            <select name="tipo" class="form-control" required <% if(sol!=null){ %> disabled<%} %>>
                                <option value="Donacion"<% if(sol!=null && sol.getTipo().equals("Donacion")){%> selected <% } %> >Donacion</option>
                                 <option value="Compra"<% if(sol!=null && sol.getTipo().equals("Compra")){ %> selected <% } %>  > Compra</option>
                                
                                
                            </select>
                            
                        </div> 
                                
                            </div>
                               
                            
                        </div>
                            
                        
                        <div class="row">
                           
                          
                            <div class="col-sm-4">
                                <div class="form-group">
                                  <label for="disabledSelect">Estado de Solicitud</label>
                                  <select id="disabledSelect" name="estado" class="form-control" required <%if(sol!=null && us.getRol().equals("Administrador")){%>disabled<%}%>>
                                        <%if(us.getRol().equals("Administrador")){ %>
                                        <%if(sol != null){%>
                                            
                                        <option value="<%=sol.getEstado()%>"><%=sol.getEstado()%></option>
                                                
                                     <%}else{ %>
                                <option value="Enviado al Sistema">Enviado al Sistema</option>
                               <%}}
                                   else
                                    if(us.getRol().equals("Secretaria OCCB")){ %>
                                 <option value="En espera de aprobacion">En espera de Aprobacion</option>
                                  <option value="Rechazada">Rechazada</option>
                                  <%}
                                        else if(us.getRol().equals("Jefe OCCB")){ %>
                                            <option value="Asignado a Registrador">Asignada a Registrado</option> 
                                              <% } %>
                                   
                                    </select>
                                </div> 
                            </div>
                                              
                                              <% if(us.getRol().equals("Jefe OCCB")){  %>
                                              <div class="col-sm-4">
                                                  <div class="form-group">
                                                      <label for="registrador">Registrador</label>
                                                      <select name="registrador" class="form-control" required>
                                                          <%  List<Usuario> reg= SistemaDeActivos.logic.Model.instance().UsuariosRegistradores();
                                                             List<Funcionario> fun = new ArrayList();
                                                             for(Usuario u : reg){
                                                                 fun.add(u.getFuncionario());
                                                             }
                                                             if( !fun.isEmpty()){
                                                                 
                                                             for(Funcionario f: fun){    
                                                             
                                                          %>
                                                           <option value="<%=f.getId()%>"><%= f.getNombre()%></option> 
                                                           <% } %>
                                                           <% } else { %>
                                                            <option value="null">Por favor agregue un registrador</option>
                                                            <% } %>
                                                      </select>
                                                      
                                                  </div>
                                                      <% } %>
                                                  
                        </div>
                           
                          </div>      
                                                                     
 
                            <div class="col-sm-4">
                                <%String errorSolicitud=(String)request.getSession().getAttribute("errorSolicitud"); %>
                                <% if(errorSolicitud!=null){%>
                                <div class="container">
                       <Medium id="Error" class="text-danger">
                       <%=errorSolicitud %>
                      </Medium>      
                       </div>
                       <div style="padding-top: 10px">
                         </div>
                             <%  } %>
                             <div style="padding-left:600px">
                             <% if(us.getRol().equals("Administrador")){%>
                                    <input type="submit" id="submit" class="btn btn-success" value="AGREGAR SOLICITUD" <% if(sol!=null){ %> disabled<%} %>>
                                    <%}if(sol!=null){
                                    if(sol.getEstado().equals("Enviado al Sistema")&&us.getRol().equals("Administrador")){%>
                                    <div style="padding-right: 100px;padding-left: 200px;padding-top: 1px;margin-top: -40px;">
                             <a href="/SistemaDeActivos/presentation/solicitud/delete?numSolElim=<%=sol.getNumero()%>" class="btn btn-danger">ELIMINAR</a>
                                    </div>
                                        <%                                }
                                                                                       }
 
                                     if(us.getRol().equals("Secretaria OCCB")){
                      
                                    %>
                                     <input type="submit" id="submit" class="btn btn-success" value="ACTUALIZAR SOLICITUD"<%if(edit != null){ %> disabled<%} %>><%  }
                                     else if(us.getRol().equals("Jefe OCCB")){
                                     %> 
                   
                                      <input type="submit" id="submit" class="btn btn-success" value="ACTUALIZAR SOLICITUD" ><%}%>
                             </div>
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
           <%String errorBien=(String)request.getSession().getAttribute("errorBien"); %>
                                <% if(errorBien!=null){%>
                                <div class="container">
                       <Medium id="Error" class="text-danger">
                       <%=errorBien %>
                      </Medium>      
                       </div>
                       <div style="padding-top: 10px">
                         </div>
                             <%  }
                              request.getSession().setAttribute("errorBien", null);              %>
                  <input type="submit" id="submit" class="btn btn-success" value="AGREGAR BIEN" <% if(sol!=null){ %> disabled<%} %> >
     </div>
  
               </form>
</div>

                    <div style="padding-bottom: 30px">
                    </div>
        <div class="container">
           
            
           
         
            <div class="row">
                <table class="table table-striped" id="bienTable">
                    <%     List<Bien> model;
                        if(sol!=null){
                        model=SistemaDeActivos.logic.Model.instance().recuperarBienesXSolicitud(sol);
                    }
                     else
                        if( request.getSession().getAttribute("Bienes")!=null){
                        
                        model=(List<Bien>) request.getSession().getAttribute("Bienes");
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
       <td style="text-align: center"  >
           <a <% if(sol==null){ %>href="/SistemaDeActivos/presentation/solicitud/delete/bien?numserie=<%=b.getNumero()%>"<%} %>><img style=" width: 10px; height:10px "src="images/delete.png"/></a></td>



                            
                            </tr>
                    <% }
                    %>
                
    
    </tbody>
  </table>
            </div>
            
           
            
                    <%request.getSession().setAttribute("editar", null);  %> 
  
        </div>
      
                    
         <div style="padding-top: 100px" >
                         <%@ include file="/presentation/bottomheader.jsp" %>  
                    </div>
              <script type="text/javascript" src="css/js/jquery.js"></script>
  <script type="text/javascript" src="css/js/bootstrap.js"></script>
 <script  src="js/ajax.js"></script>
     <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap4.min.js"></script> 
     <script>
     $(document).ready(function() {
              $('#bienTable').DataTable( {
        scrollY:        200,
        scrollCollapse: true,
        paging:         false,
        info: false
    } );
} );
     </script>
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
