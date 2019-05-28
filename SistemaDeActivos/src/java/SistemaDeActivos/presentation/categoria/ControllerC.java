/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SistemaDeActivos.presentation.categoria;

import SistemaDeActivos.logic.Categoria;
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
@WebServlet(name = "ControllerC", urlPatterns = {"/ControllerC","/presentation/create/categoria","/presentation/categoria/delete",
"/presentation/categoria/update","/presentation/categoria/consult"})
public class ControllerC extends HttpServlet {
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
            if (request.getServletPath().equals("/presentation/create/categoria"))
                this.create(request, response);
               if (request.getServletPath().equals("/presentation/categoria/consult"))
                this.consult(request, response);
               if (request.getServletPath().equals("/presentation/categoria/delete"))
                this.delete(request, response);
               if (request.getServletPath().equals("/presentation/categoria/update"))
                this.update(request, response);
            
 }

  protected void update(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
      try{
            this.updateModel(request, response);
            SistemaDeActivos.logic.Model.instance().actualizarCategoria(model.c);
            this.list(request, response);
      }
      
      catch(Exception e){
           String errorFuncionario=e.getMessage();
      request.getSession().setAttribute("errorCategoria", errorFuncionario);
       request.getRequestDispatcher("/presentation/categoria/create/Categoria.jsp").forward( request, response); 
      }
  }
  protected void list(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
   request.getRequestDispatcher("/presentation/categoria/list/listCategorias.jsp").forward( request, response); 
  }

 
  protected void delete(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
  try{
      String id=request.getParameter("numCate");
      Categoria f= SistemaDeActivos.logic.Model.instance().recuperarCategoria(Integer.parseInt(id));
      SistemaDeActivos.logic.Model.instance().eliminarCategoria(f);
      this.list(request, response);
  }
  catch(Exception e){
      String errorFuncionario=e.getMessage();
      request.getSession().setAttribute("errorCategoria", errorFuncionario);
       request.getRequestDispatcher("/presentation/categoria/create/Categoria.jsp").forward( request, response); 
      
  }
  }
 protected void consult(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
     try{
         String id= request.getParameter("idCategoria");
         int cod=Integer.parseInt(id);
        Categoria fun= SistemaDeActivos.logic.Model.instance().recuperarCategoria(cod);
         if(fun != null)
             model.c=fun;
         
         request.getSession().setAttribute("modelCategoria", fun);
         String editar="editar";
                request.getSession().setAttribute("editarCategoria", editar);
          request.getRequestDispatcher("/presentation/categoria/create/Categoria.jsp").forward( request, response); 
     }
     catch(Exception e){
         String error=e.getMessage();
         int a=0;
     }
 }
 
 protected void create(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception {
 
     try{
     this.updateModel(request, response);
     SistemaDeActivos.logic.Model.instance().agregarCategoria(model.c);
     request.getRequestDispatcher("/presentation/categoria/create/Categoria.jsp").forward( request, response);
     }
     catch(Exception e){
         
     }
 }
 
protected void updateModel(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException, Exception { 
    try{
   String categoria= request.getParameter("idCategoria");
   String nombre= request.getParameter("nombreCategoria");
  String consecutivo=request.getParameter("consecutivo");
  if(consecutivo!=null){
      model.c.setConsecutivo(Integer.parseInt(consecutivo));
  }
  else{
      model.c.setConsecutivo(0);
  }
   model.c.setCategoria(Integer.parseInt(categoria));
   model.c.setDescripcion(nombre);
   
   
   
    }
    catch(Exception e){
        String error=e.getMessage();
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
        Logger.getLogger(ControllerC.class.getName()).log(Level.SEVERE, null, ex);
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
        Logger.getLogger(ControllerC.class.getName()).log(Level.SEVERE, null, ex);
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
