/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SistemaDeActivos.presentation.activo;

import SistemaDeActivos.logic.Activo;
import SistemaDeActivos.logic.Bien;
import SistemaDeActivos.logic.Categoria;
import SistemaDeActivos.logic.Dependencia;
import SistemaDeActivos.logic.Funcionario;
import SistemaDeActivos.logic.Solicitud;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "ContollerA", urlPatterns = {"/presentation/activo/create/solicitud","/presentation/activo/rotular/sol",
"/presentation/activo/create/finalizar/siguiente","/presentation/activo/create/finalizar/ultimo","/presentation/activo/list",
"/presentation/activo/detalle"})
public class ContollerA extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String a=request.getServletPath();
        if (request.getServletPath().equals("/presentation/activo/create/solicitud")) {
            this.create(request, response);
        }
           if (request.getServletPath().equals("/presentation/activo/rotular/sol")) {
            this.rotular(request, response);
        }
           
             if (request.getServletPath().equals("/presentation/activo/create/finalizar/siguiente")) {
            this.siguiente(request, response);
             }
            
          if (request.getServletPath().equals("/presentation/activo/create/finalizar/ultimo")) {
            this.finalizar(request, response);
        }
          
            if (request.getServletPath().equals("/presentation/activo/list")) {
            this.buscar(request, response);
        }
         if (request.getServletPath().equals("/presentation/activo/detalle")) {
            this.detalle(request, response);
        }
    }
    
      protected void detalle(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
      try{
          String id=request.getParameter("numActi");
          int cod= Integer.parseInt(id);
        Activo a=  SistemaDeActivos.logic.Model.instance().recuperarActivoCompleto(cod);
          request.getSession().setAttribute("ActivoModel",a);
           request.getRequestDispatcher("/presentation/activo/list/DetalleActivo.jsp").forward(request, response);
      }
      catch(Exception e){
          request.getRequestDispatcher("/presentation/activo/list/listActivos.jsp").forward(request, response);
      }
      }
     protected void buscar(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
         try{
             String op=request.getParameter("criterioActivo");
             if(op.equals("todos")){
                 List<Activo> acs= SistemaDeActivos.logic.Model.instance().recuperarActivos();
                 request.getSession().setAttribute("ListaActivos", acs);
             }
             else if(op.equals("codActivo")){
                 String aux=request.getParameter("textoActivo");
                 List<Activo> acs= SistemaDeActivos.logic.Model.instance().recuperarActivosXCodigo(aux);
                 request.getSession().setAttribute("ListaActivos", acs);
             }
             else if(op.equals("dependenciaActivo")){
                  String aux=request.getParameter("textoActivo");
                                 List<Activo> acs= SistemaDeActivos.logic.Model.instance().recuperarActivosXDependencia(aux);
                 request.getSession().setAttribute("ListaActivos", acs);
             }
             else if(op.equals("funcionarioActivo")){
                  String aux=request.getParameter("textoActivo");
                                 List<Activo> acs= SistemaDeActivos.logic.Model.instance().recuperarActivosXFuncionario(aux);
                 request.getSession().setAttribute("ListaActivos", acs);
             }
             else if(op.equals("categoriaActivo")){
                  String aux=request.getParameter("textoActivo");
                                 List<Activo> acs= SistemaDeActivos.logic.Model.instance().recuperarActivosXCategoria(aux);
                 request.getSession().setAttribute("ListaActivos", acs);
             }
             else{
                     List<Activo> acs= new ArrayList();
                 request.getSession().setAttribute("ListaActivos", acs);
             }
             
              request.getRequestDispatcher("/presentation/activo/list/listActivos.jsp").forward(request, response);
         }
         catch(Exception e){
             String error=e.getMessage();
              request.getRequestDispatcher("/presentation/activo/list/listActivos.jsp").forward(request, response);
         }
     }
       protected void finalizar(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
                  try{
                    Solicitud sol = (Solicitud) request.getSession().getAttribute("SolXFinalizar");
                    int num= Integer.parseInt(request.getParameter("ultActivoNum"));
                    Activo a= SistemaDeActivos.logic.Model.instance().recuperarActivo(num);
                     String aux=request.getParameter("dependenciaFin");
                    if(aux.equals("Por favor agregue una dependencia")){
                        throw new Exception("Por favor agregue una dependencia");
                    }
                    int cod=Integer.parseInt(aux);
                    
                   Dependencia dep=SistemaDeActivos.logic.Model.instance().recuperarDependencia(cod);
                    a.setDependencia(dep);
                    String id=request.getParameter("funcionariosFin");
                    if(id.equals("Sin funcionario")){
                        throw new Exception("Por Favor agregue un funcionario");
                    }
                    Funcionario f=SistemaDeActivos.logic.Model.instance().getFuncionario(id);
                    a.setFuncionario(f);
                    a.setPuesto(request.getParameter("puestoActivo"));
                    SistemaDeActivos.logic.Model.instance().actualizarActivo(a);
                   
                      request.getSession().removeAttribute("totalActivos");
                      sol.setEstado("Solicitud procesada");
                      SistemaDeActivos.logic.Model.instance().actualizarSolicitud(sol);
                      
                        request.getSession().removeAttribute("SolXFinalizar");
                    request.getRequestDispatcher("/presentation/menu/Menu.jsp").forward(request, response);
                }
                catch(Exception e){
                    String error=e.getMessage();
                    request.getSession().setAttribute("errorFinalizarActivo", e);
                     request.getRequestDispatcher("/presentation/activo/create/FinalizarActivo.jsp").forward(request, response);
                }
            }
         protected void siguiente(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
                try{
                    Solicitud sol = (Solicitud) request.getSession().getAttribute("SolXFinalizar");
                    int num= Integer.parseInt(request.getParameter("activoNum"));
                    Activo a= SistemaDeActivos.logic.Model.instance().recuperarActivo(num);
                    
                    String aux=request.getParameter("dependenciaFin");
                    if(aux.equals("Por favor agregue una dependencia")){
                        throw new Exception("Por favor agregue una dependencia");
                    }
                    int cod=Integer.parseInt(aux);
                    
                   Dependencia dep=SistemaDeActivos.logic.Model.instance().recuperarDependencia(cod);
                    a.setDependencia(dep);
                    String id=request.getParameter("funcionariosFin");
                    if(id.equals("Sin funcionario")){
                        throw new Exception("Por Favor agregue un funcionario");
                    }
                    Funcionario f=SistemaDeActivos.logic.Model.instance().getFuncionario(id);
                    a.setFuncionario(f);
                    a.setPuesto(request.getParameter("puestoActivo"));
                    SistemaDeActivos.logic.Model.instance().actualizarActivo(a);
                      List<Activo> activos = (List<Activo>) request.getSession().getAttribute("totalActivos");
                      List<Activo> newactivos= new ArrayList();
                      
                      for(Activo a2: activos){
                          if(a2.getCodigo()!=num){
                             newactivos.add(a2);
                          }
                      }
                      request.getSession().setAttribute("totalActivos", newactivos);
                    request.getRequestDispatcher("/presentation/activo/create/FinalizarActivo.jsp").forward(request, response);
                }
                catch(Exception e){
                    String error=e.getMessage();
                    request.getSession().setAttribute("errorFinalizarActivo", e);
                     request.getRequestDispatcher("/presentation/activo/create/FinalizarActivo.jsp").forward(request, response);
                }
         }
      protected void rotular(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
      
          try{
              String num=request.getParameter("numeroSolRo");
              Solicitud s= SistemaDeActivos.logic.Model.instance().recuperar(Integer.parseInt(num));
              request.getSession().setAttribute("SolXFinalizar", s);
              List<Activo> activos = new ArrayList();
              
              for(Bien b:  s.getBiens()){
                  Bien b2=SistemaDeActivos.logic.Model.instance().recuperarBien(b.getNumero());
                  List<Activo> aux= SistemaDeActivos.logic.Model.instance().recuperarActivosXBien(b2.getNumero());
                  for(Activo a: aux){
                      activos.add(a);
                  }
              }
              request.getSession().setAttribute("totalActivos", activos);
              request.getRequestDispatcher("/presentation/activo/create/FinalizarActivo.jsp").forward(request, response);
          }
          catch(Exception e){
               request.getRequestDispatcher("/presentation/solicitud/list/list.jsp").forward(request, response);
          }
      }
    
    protected void create(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int num = Integer.parseInt(request.getParameter("numeroSolXAct"));
            Solicitud sol = SistemaDeActivos.logic.Model.instance().recuperar(num);
            for (Bien b : sol.getBiens()) {
                String aux = request.getParameter(Integer.toString(b.getNumero()));
                if (aux.equals("Sin Asignar")) {
                    throw new Exception("Error! Favor verificar que todos los bienes tengan categoria");
                }
                    Categoria c= SistemaDeActivos.logic.Model.instance().recuperarCategoria(Integer.parseInt(aux));
                    for(int i=0; i<b.getCantidad(); i++){
                       Activo a= new Activo();
                    a.setBien(b);
                    c.setConsecutivo(c.getConsecutivo()+1);
                    a.setCategoria(c);
                    a.setConsecutivo(c.getConsecutivo());
                    SistemaDeActivos.logic.Model.instance().actualizarCategoria(c);
                    SistemaDeActivos.logic.Model.instance().agregarActivo(a);
                    }
                    
            }
            sol.setEstado("En espera de rotulacion");
            SistemaDeActivos.logic.Model.instance().actualizarSolicitud(sol);
            request.getRequestDispatcher("/presentation/solicitud/list/list.jsp").forward(request, response);

        } catch (Exception e) {
            
            String error = e.getMessage();
            request.getSession().setAttribute("errorActivo/jsp", e);
            request.getRequestDispatcher("/presentation/activo/create/Activo.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
