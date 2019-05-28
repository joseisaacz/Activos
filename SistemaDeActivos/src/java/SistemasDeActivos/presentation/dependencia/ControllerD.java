/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SistemasDeActivos.presentation.dependencia;

import SistemaDeActivos.logic.Dependencia;
import SistemaDeActivos.logic.Funcionario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author admin
 */
@WebServlet(name = "ControllerD", urlPatterns = {"/ControllerD","/presentation/create/dependencia","/presentation/dependencia/delete",
"/presentation/dependencia/update","/presentation/dependencia/consult"})
public class ControllerD extends HttpServlet {
Model model=new Model();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  protected void processRequest(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
     String a= request.getServletPath();
            if (request.getServletPath().equals("/presentation/solicitud/create/dependencia"))
                this.create(request, response);
               if (request.getServletPath().equals("/presentation/dependencia/consult"))
                this.consult(request, response);
               if (request.getServletPath().equals("/presentation/dependencia/delete"))
                this.delete(request, response);
               if (request.getServletPath().equals("/presentation/dependencia/update"))
                this.update(request, response);
            
 }

  protected void update(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
      try{
            this.updateModel(request, response);
            SistemaDeActivos.logic.Model.instance().actualizarDependencia(model.d);
            this.list(request, response);
      }
      
      catch(Exception e){
           String errorDependencia=e.getMessage();
      request.getSession().setAttribute("errorDependencia", errorDependencia);
       request.getRequestDispatcher("/presentation/dependencia/create/Dependencia.jsp").forward( request, response); 
      }
  }
  protected void list(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
   request.getRequestDispatcher("/presentation/dependencia/list/listDependencias.jsp").forward( request, response); 
  }

 
  protected void delete(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
  try{
      String id=request.getParameter("codDepen");
      Dependencia dep=SistemaDeActivos.logic.Model.instance().recuperarDependencia(Integer.parseInt(id));
      SistemaDeActivos.logic.Model.instance().eliminarDependencia(dep);
      this.list(request, response);
  }
  catch(Exception e){
      String errorDependencia=e.getMessage();
      request.getSession().setAttribute("errorDependencia", errorDependencia);
       request.getRequestDispatcher("/presentation/dependencia/create/Dependencia.jsp").forward( request, response); 
      
  }
  }
 protected void consult(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
     try{
         String id= request.getParameter("codDepen");
         Dependencia fun= SistemaDeActivos.logic.Model.instance().recuperarDependencia(Integer.parseInt(id));
         if(fun != null)
             model.d=fun;
         
         request.getSession().setAttribute("modelDependencia", fun);
         String editar="editar";
                request.getSession().setAttribute("editarDependencia", editar);
          request.getRequestDispatcher("/presentation/dependencia/create/Dependencia.jsp").forward( request, response); 
     }
     catch(Exception e){
         
     }
 }
 
 protected void create(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
 
     try{
     this.updateModel(request, response);
     SistemaDeActivos.logic.Model.instance().agregarDependencia(model.d);
     
     }
     catch(Exception e){
         
     }
 }
 
protected void updateModel(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception { 
    try{
   String id= request.getParameter("codigoDependencia");
   String nombre= request.getParameter("nombreDependencia");
   String funcionario = request.getParameter("FuncDepen");
   if(funcionario.equals("Agregar mas tarde")){
       throw new Exception("Por favor agregue una dependencia");
   }
   Funcionario f= SistemaDeActivos.logic.Model.instance().getFuncionario(funcionario);
   
  model.d.setCodigo(Integer.parseInt(id));
  model.d.setNombre(nombre);
  model.d.setFuncionario(f);
   
    }
    catch(Exception e){
        throw new Exception(e.getMessage());
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
    try {
        processRequest(request, response);
    } catch (Exception ex) {
        Logger.getLogger(ControllerD.class.getName()).log(Level.SEVERE, null, ex);
    }
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
    try {
        processRequest(request, response);
    } catch (Exception ex) {
        Logger.getLogger(ControllerD.class.getName()).log(Level.SEVERE, null, ex);
    }
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
