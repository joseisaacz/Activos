<%-- 
    Document   : Categoria
    Created on : 18-May-2019, 18:49:53
    Author     : admin
--%>

<%@page import="SistemaDeActivos.logic.Categoria"%>
<%@page import="SistemaDeActivos.logic.Model"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <%@ include file="/presentation/headerprin.jsp" %> 
        <link rel = "stylesheet" type = "text/css" href = "css/css/bootstrap.css" >
        <title>Registrar Categoria</title>
    </head>
    <body>
    <body>
        <% String editar = (String) request.getSession().getAttribute("editarCategoria");
            Categoria model = (Categoria) request.getSession().getAttribute("modelCategoria");
        %>
        <div style="margin-top: 100px"></div>
        <div class="container">

            <h3 style="text-align: center">Registrar Categoria</h3> 
            <div class="jumbotron">

                <form method="POST" name="formulario" id="formulario" action="/SistemaDeActivos/presentation/create/categoria">

                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <label >Numero de Categoria</label>
                                <input type="text" class="form-control" id="id"  name="idCategoria" required <% if (model != null) {%> value="<%= model.getCategoria()%>" <%}%>>

                            </div>    
                        </div>
                        <div class="col">
                            <div class="form-group">
                                <label >Nombre de la categoria</label>
                                <input type="text" class="form-control" name="nombreCategoria" id="nombre" required <%if (model != null) {%> value="<%=model.getDescripcion()%>" <%}%>>

                            </div>    
                        </div>

                    </div>
                                <%if(model!= null){%>
                    <div class="row">
                        <div class="col-sm-4">
                            <div class="form-group">
                             <input type="text" value="<%=model.getConsecutivo()%> "  class="form-control" name="consecutivo" readonly>
                            </div>
                        </div>
                    </div>
                    <%}%>
                    <div style="margin-top: 50px"></div>
                    <% if (model == null) { %>
                    <div class="row">
                        <div style="margin-left: 250px"></div>
                        <div class="col">

                            <input type="submit" id="submit" class="btn btn-success" value="AGREGAR" > 
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;&nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;&nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; 
                            <input type="button" id="cancelar" class="btn btn-danger" value="CANCELAR" onclick="javascript:cleanF();">
                        </div>


                    </div>
                    <%}%>
                </form>
                <%if (editar != null) {%>

                <div class="col-4 mx-auto">



                    <a href="/SistemaDeActivos/presentation/categoria/delete?numCate=<%=model.getCategoria()%>" class="btn btn-danger">ELIMINAR</a>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;&nbsp;

                    <a href="/SistemaDeActivos/presentation/categoria/update?numCate=<%=model.getCategoria()%>" class="btn btn-success">ACTUALIZAR</a>

                </div>


                <% } %>     
            </div>
        </div>
        <% String error = (String) request.getSession().getAttribute("errorCategoria");
                 if (error != null) {%>


        <div class="container">
            <Medium id="Error" class="text-danger">
                <%=error%>
            </Medium>      
        </div>
        <%  request.getSession().setAttribute("errorCategoria", null);
              } %>
        <div >
            <%@ include file="/presentation/bottomheader.jsp" %>  
        </div>
        <script  src="css/js/jquery.js"></script>
        <script  src="css/js/bootstrap.js"></script>
        <script  src="js/ajax.js"></script>

        <%  request.getSession().setAttribute("editarCategoria", null);
            request.getSession().setAttribute("modelCategoria", null);
        %> 

        <script>     function cleanF() {
           document.getElementById("formulario").reset();
       }

        </script>

        <script type="text/javascript" src="css/js/jquery.js"></script>
        <script type="text/javascript" src="css/js/bootstrap.js"></script>
        <script  src="js/ajax.js"></script>
    </body>
</html>