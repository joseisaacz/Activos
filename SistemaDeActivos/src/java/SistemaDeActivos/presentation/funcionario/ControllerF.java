/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SistemaDeActivos.presentation.funcionario;

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
@WebServlet(name = "ControllerF", urlPatterns = {"/ControllerF","/presentation/create/funcionario","/presentation/funcionario/consult",
"/presentation/funcionario/delete","/presentation/funcionario/update"})
public class ControllerF extends HttpServlet {
  Model model = new Model();
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
            if (request.getServletPath().equals("/presentation/create/funcionario"))
                this.create(request, response);
               if (request.getServletPath().equals("/presentation/funcionario/consult"))
                this.consult(request, response);
               if (request.getServletPath().equals("/presentation/funcionario/delete"))
                this.delete(request, response);
               if (request.getServletPath().equals("/presentation/funcionario/update"))
                this.update(request, response);
            
 }

  protected void update(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
      try{
            this.updateModel(request, response);
           
            String id=request.getParameter("numFun");
             Funcionario faux=SistemaDeActivos.logic.Model.instance().getFuncionario(id);
             faux.setId(id);
            faux.setNombre(model.f.getNombre());
            faux.setDependencia(model.f.getDependencia());
            SistemaDeActivos.logic.Model.instance().actualizarFuncionario(faux);
            this.list(request, response);
      }
      
      catch(Exception e){
           String errorFuncionario=e.getMessage();
      request.getSession().setAttribute("errorFuncionario", errorFuncionario);
       request.getRequestDispatcher("/presentation/funcionario/create/Funcionario.jsp").forward( request, response); 
      }
  }
  protected void list(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
   request.getRequestDispatcher("/presentation/funcionario/list/listFuncionarios.jsp").forward( request, response); 
  }

 
  protected void delete(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
  try{
      String id=request.getParameter("idFunc");
      Funcionario f= SistemaDeActivos.logic.Model.instance().getFuncionario(id);
      SistemaDeActivos.logic.Model.instance().eliminarFuncionario(f);
      this.list(request, response);
  }
  catch(Exception e){
      String errorFuncionario=e.getMessage();
      request.getSession().setAttribute("errorFuncionario", errorFuncionario);
       request.getRequestDispatcher("/presentation/funcionario/create/Funcionario.jsp").forward( request, response); 
      
  }
  }
 protected void consult(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
     try{
         String id= request.getParameter("idFunc");
         Funcionario fun= SistemaDeActivos.logic.Model.instance().getFuncionario(id);
         if(fun != null)
             model.f=fun;
         
         request.getSession().setAttribute("modelFuncionario", fun);
         String editar="editar";
                request.getSession().setAttribute("editarFuncionario", editar);
          request.getRequestDispatcher("/presentation/funcionario/create/Funcionario.jsp").forward( request, response); 
     }
     catch(Exception e){
         
     }
 }
 
 protected void create(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
 
     try{
     Funcionario f=this.updateModel(request, response);
     SistemaDeActivos.logic.Model.instance().agregarFuncionario(f);
     this.list(request, response);
     }
     catch(Exception e){
         
     }
 }
 
protected Funcionario updateModel(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception { 
    try{
   String id= request.getParameter("idFuncionario");
   String nombre= request.getParameter("nombreFuncionario");
   String dependencia = request.getParameter("dependenciaFun");
   if(dependencia.equals("Agregue una Dependencia")){
       throw new Exception("Por favor agregue una dependencia");
   }
   int dep = Integer.parseInt(dependencia);
   Dependencia depe= SistemaDeActivos.logic.Model.instance().recuperarDependencia(dep);
    model.f.setId(id);
    model.f.setNombre(nombre);
    model.f.setDependencia(depe);
    Funcionario f= new Funcionario();
    f.setId(model.f.getId());
    f.setNombre(model.f.getNombre());
    f.setDependencia(model.f.getDependencia());
    return f;
   
    }
    catch(Exception e){
        throw new Exception("ERROR");
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
          Logger.getLogger(ControllerF.class.getName()).log(Level.SEVERE, null, ex);
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
          Logger.getLogger(ControllerF.class.getName()).log(Level.SEVERE, null, ex);
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
