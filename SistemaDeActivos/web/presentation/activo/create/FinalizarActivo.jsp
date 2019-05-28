<%-- 
    Document   : FinalizarActivo
    Created on : 23-May-2019, 23:03:49
    Author     : admin
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.Collections"%>
<%@page import="SistemaDeActivos.logic.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="SistemaDeActivos.logic.Solicitud"%>
<%@page import="SistemaDeActivos.logic.Activo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finalizar Activo</title>
        <%@ include file="/presentation/headerprin.jsp" %>  
        <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >

    </head>
    <body>
        <% Solicitud sol = (Solicitud) request.getSession().getAttribute("SolXFinalizar");
            List<Activo> activos = (List<Activo>) request.getSession().getAttribute("totalActivos");
            Activo act = null;
            if (activos != null) {
                act = activos.get(0);
            }
        %>
        <div class="container">

            <h3 style="text-align: center">Actualizar Activo</h3> 
            <div class="jumbotron">

                <form method="POST" name="formulario" id="formulario" action="<%= activos.size()>1?"/SistemaDeActivos/presentation/activo/create/finalizar/siguiente?activoNum="+act.getCodigo():
                
                      "/SistemaDeActivos/presentation/activo/create/finalizar/ultimo?ultActivoNum="+act.getCodigo()%>">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label > Codigo Activo </label>
                                <input type="text" value=" <%= act != null ? act.getCodigo() : "ERROR"%>" class="form-control"   name="codActivo" readonly>

                            </div>  
                        </div>

                        <div class="col">
                            <div class="form-group">
                                <label > Numero de Bien </label>
                                <input type="text" value=" <%= act != null && act.getBien() != null ? act.getBien().getNumero() : "ERROR"%>" class="form-control"   name="numBien" readonly>

                            </div>  
                        </div>


                    </div>

                    <div class="row">

                        <div class="col">
                            <div class="form-group">
                                <label > Categoria </label>
                                <input type="text" value=" <%= act != null ? act.getCategoria().getDescripcion() : "ERROR"%>" class="form-control"   name="categoria" readonly>

                            </div>  
                        </div>

                        <div class="col">
                            <div class="form-group">
                                <label >Numero Consecutivo </label>

                                <input type="text" value=" <%= act != null ? act.getConsecutivo() : "ERROR"%>" class="form-control"   name="consecutivo" readonly>

                            </div>  
                        </div>


                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label >Funcionario Responsable del Activo</label>
                                <% List<Funcionario> funcionarios
                                            = SistemaDeActivos.logic.Model.instance().recuperarFuncionariosXDependencias(sol.getDependencia().getCodigo());
                                %>
                                <select class="form-control" name="funcionarioResponsable">
                                    <%  if (!funcionarios.isEmpty()) {
                                            for (Funcionario f : funcionarios) {
                                    %>
                                    <option value="<%=f.getId()%>"><%=f.getNombre()%></option>
                                    <% }
                                } else {%>
                                    <option value="N/F">
                                        Registre un funcionario en la dependencia
                                    </option>
                                    <%}%>
                                </select>
                            </div>    
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label >Puesto</label>
                                <input type="text" class="form-control" name="puestoActivo" required>

                            </div>    
                        </div>

                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label >Dependencia</label>
                                <input type="text" class="form-control" name="dependenciaActivo" value="<%= sol.getDependencia().getNombre()%>"  readonly>

                            </div>   
                        </div>

                        <div class="col">
                            <div class="form-group">
                                <label class="form-group">Codigo de Barras</label>  <br>
                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                    Ver codigo de barras
                                </button>
                            </div>
                                <div class="modal" id="myModal">
                                    <div class="modal-dialog">
                                        <div class="modal-content">

                                            <!-- Modal Header -->
                                            <div class="modal-header">
                                                <h4 class="modal-title">Codigo de Barras</h4>
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                            </div>

                                            <!-- Modal body -->
                                            <div class="modal-body">
                                                <% String a= act.getBien().getNumero()+act.getCodigo()+act.getCategoria().getDescripcion();
                                                    String result=shuffleString(a);
                                                %>
                                                <div style="margin-left: 100px">
                                                    <img id="barcode2"/>
                                                </div>
                                                
                                                <script  src="js/JsBarcode.all.min.js"></script>
                                                <script>
                                                   JsBarcode("#barcode2", "<%=result%>", {
                                                      format:"CODE39",
                                                        displayValue:true,
                                                     fontSize:24,
                                                    lineColor: "#000000",
                                                    width:1
                                                        });
                                                </script>
                                              
                                            </div>

                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>


                           
                        </div>

                    </div>
                    <div style="margin-top: 50px"></div>
                    <div class="row">
                        <div style="margin-left: 250px"></div>
                        <div class="col">
                            <% activos.remove(0);
                                    if(activos.size()>0){ %>
                            <input type="submit" id="submit" class="btn btn-success" value="Siguiente" >
                            <% activos.add(act); %>
                            <%}
                            else{
                            %>
                             <input type="submit" id="submit" class="btn btn-success" value="Actualizar Solicitud" > 
                           <% activos.add(act);    } 
                           
                           %>
                        </div>


                    </div>

                </form>
                        <% String error= (String) request.getSession().getAttribute("errorFinalizarActivo");
                                if( error!= null) { %>
            
              
        <div class="container">
        <Medium id="Error" class="text-danger">
          <%=error %>
        </Medium>      
      </div>
          <%  request.getSession().setAttribute("errorFinalizarActivo", null); } %>
            </div>
        </div>
        <script type="text/javascript" src="css/js/jquery.js"></script>
        <script type="text/javascript" src="css/js/bootstrap.js"></script>
        <script  src="js/ajax.js"></script>
        
        <%! 
       String shuffleString(String string)
{
  List<String> letters = Arrays.asList(string.split(""));
  Collections.shuffle(letters);
  String shuffled = "";
  for (String letter : letters) {
    shuffled += letter;
  }
  return shuffled;
}
        %>
    </body>
</html>
