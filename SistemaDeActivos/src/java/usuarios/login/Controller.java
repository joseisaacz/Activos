/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package usuarios.login;

import SistemaDeActivos.logic.Categoria;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import SistemaDeActivos.logic.Model;
import SistemaDeActivos.logic.Solicitud;
import SistemaDeActivos.logic.Usuario;
import java.util.List;

/**
 *
 * @author Escinf
 */
/*

--------------------------------------------------------------------------------------------

LEER README EN SISTEMADEACTIVOS/README

*/
@WebServlet(name = "presentation.usuarios.login", urlPatterns = {"/presentation/usuarios/login/prepareLogin","/presentation/usuarios/login/login","/presentation/usuarios/login/logout"})
public class Controller extends HttpServlet {

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
            throws ServletException, IOException {
            if (request.getServletPath().equals("/presentation/usuarios/login/prepareLogin"))
                this.prepareLogin(request, response);        
            if (request.getServletPath().equals("/presentation/usuarios/login/login"))
                this.login(request, response);
            if (request.getServletPath().equals("/presentation/usuarios/login/logout"))
                this.logout(request, response);            
    }

    protected void prepareLogin(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Usuario model = new Usuario();
        request.setAttribute("model", model);
        request.getSession(true).setAttribute("usuario", (Usuario)request.getAttribute("model"));
        request.getRequestDispatcher("/presentation/usuarios/login/View.jsp").forward( request, response); 
    } 

    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
         if(this.verificar(request)){
            Map<String,String> errors =  this.validar(request);
            boolean errorBase=false;
            if(errors.isEmpty()){
                 Usuario model = new Usuario();
                updateModel(model,request);
                request.setAttribute("model", model);
                Usuario logged=null;
                try {
                   // request.login(model.getId(), model.getClave());
                    logged=Model.instance().getUsuario(model.getId(),model.getClave());
                  
                    request.getSession(true).setAttribute("logged", logged);
                    errorBase=false;
                     request.setAttribute("errorBase", errorBase);
                 request.getRequestDispatcher("/presentation/menu/Menu.jsp").forward(request, response);
                } catch (Exception ex) {
                    errorBase=true;
                    request.setAttribute("errorBase", errorBase);
                    request.getRequestDispatcher("/presentation/usuarios/login/View.jsp").forward(request, response);
                }  
                   
                              
            }
            else{
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("/presentation/usuarios/login/View.jsp").forward(request, response);
            }            
        }
        else{
            request.getRequestDispatcher("/presentation/Error.jsp").forward(request, response);            
        }
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            HttpSession session = request.getSession(true);
            session.removeAttribute("logged");
            session.invalidate();
            request.getRequestDispatcher("/presentation/usuarios/login/prepareLogin").forward( request, response); 
    }           

    boolean verificar(HttpServletRequest request){
       if (request.getParameter("id")==null) return false;
       if (request.getParameter("clave")==null) return false; 
       return true;
    }
    
    Map<String,String> validar(HttpServletRequest request){
        Map<String,String> errores = new HashMap<>();
        if (request.getParameter("id").isEmpty()){
            errores.put("id","Id requerido");
        }

        if (request.getParameter("clave").isEmpty()){
            errores.put("clave","Clave requerida");
        }
        return errores;
    }
        
    void updateModel(Usuario model, HttpServletRequest request){
        model.setId(request.getParameter("id"));
        model.setClave(request.getParameter("clave"));
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
