/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SistemaDeActivos.presentation.solicitud;

import SistemaDeActivos.logic.Bien;
import SistemaDeActivos.logic.Funcionario;
import SistemaDeActivos.logic.Solicitud;
import SistemaDeActivos.logic.Usuario;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
@WebServlet(name = "presentation.solicitud", urlPatterns = {"/presentation/solicitud/create/bien","/presentation/solicitud/list",
    "/presentation/solicitud/create/solicitud.jsp","/presentation/solicitud/create/solicitud", "/presentation/solicitud/delete/bien",
"/presentation/solicitud/prepare", "/presentation/solicitud/consult"})
public class Controller extends HttpServlet {
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
            if (request.getServletPath().equals("/presentation/solicitud/create/bien"))
                this.create(request, response);
              if (request.getServletPath().equals("/presentation/solicitud/list"))
                  this.list(request,response);
               if (request.getServletPath().equals("/presentation/solicitud/create/solicitud"))
                  this.createSolicitud(request, response);
                if (request.getServletPath().equals("/presentation/solicitud/delete/bien"))
                this.deleteBien(request, response);
              if (request.getServletPath().equals("/presentation/solicitud/prepare"))
            this.prepare(request, response);
              if(request.getServletPath().equals("/presentation/solicitud/consult"))
                  this.consult(request, response);
    }
 
  protected void prepare(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException {
  
      
  
  }
    protected void deleteBien(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException {
    
        if(!model.bienes.isEmpty()){
           
            int num=Integer.parseInt(request.getParameter("numserie"));
            if(model.bienes.remove(num)!=null){
                 HttpSession session=request.getSession(true);
                session.setAttribute("Bienes", model.listar());
                 request.getRequestDispatcher("/presentation/solicitud/create/Solicitud.jsp").forward( request, response); 
            }
            else{
                 request.getRequestDispatcher("/presentation/solicitud/create/Solicitud.jsp").forward( request, response); 
            }
        }
    
    }
    
        protected void create(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException {
            Bien b= updateModel(model,request,response);
            try {
                model.agregarB(b,b.getNumero());
                HttpSession session=request.getSession(true);
                session.setAttribute("Bienes", model.listar());
                  
            } catch (Exception ex) {      
            }
            request.getRequestDispatcher("/presentation/solicitud/create/Solicitud.jsp").forward( request, response); 
    }
        
         protected void createSolicitud(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException {
         
             try{
                 Solicitud s= this.updateSolicitud(request);
             model.setSolicitud(s);
            
             if(s.getComprobante()==null)
                 throw new Exception("Datos incompletos");
             if(s.getFecha()==null)
                 throw new Exception("Datos incompletos");
             if(s.getTipo()==null)
                 throw new Exception("Datos incompletos");
             if(s.getEstado()==null)
                 throw new Exception("Datos incompletos");
              if(model.getBienes().isEmpty())
                 throw new Exception("Debe ingresar al menos un bien" );
              List<Bien> bienes=new ArrayList((List<Bien>)request.getSession(true).getAttribute("Bienes"));
              Solicitud sol=model.getSolicitud();
              for(Bien b: bienes){
                 b.setSolicitud(sol);
              sol.getBiens().add(b);
              }
               SistemaDeActivos.logic.Model.instance().agregarSolicitud(sol);
             
                      bienes.clear();
              // model.getBienes().clear();
               request.getSession(true).setAttribute("Bienes", bienes);
                  List<Solicitud> lista= SistemaDeActivos.logic.Model.instance().recuperarSolicitudes();
                  this.prueba();
                request.getRequestDispatcher("/presentation/solicitud/create/Solicitud.jsp").forward( request, response); 
             }
             catch(Exception e){
                 String pru=e.getMessage();
                 String error=null;
                 if(e.getMessage().equals("Datos incompletos"))
                 error="Datos incompletos";
                 else
                     if(e.getMessage().equals("Debe ingresar al menos un bien"))
                         error="Debe ingresar al menos un bien";
                 else
                     error="Por favor Digite un numero";
                 
                 request.setAttribute("modelSolicitud",model.sol);
                 request.setAttribute("errorSolicitud", error);
                 request.setAttribute("date", model.fecha);
                  request.getRequestDispatcher("/presentation/solicitud/create/Solicitud.jsp").forward( request, response); 
             }
             
             
         
         }
        protected void prueba(){
               List<Solicitud> listasc= SistemaDeActivos.logic.Model.instance().recuperarSolicitudes();
        }
        protected void list(HttpServletRequest request, 
                                  HttpServletResponse response)
            throws ServletException, IOException {
           
            request.getRequestDispatcher("/presentation/solicitud/list/list.jsp").forward( request, response); 
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
          Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
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
          Logger.getLogger(Controller.class.getName()).log(Level.SEVERE, null, ex);
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
 Bien updateModel(Model m, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       
//     if(request.getParameter("numserie").equals(null)){
//         request.setAttribute("descripcion", request.getParameter("descripcion"));
//         request.getRequestDispatcher("/presentation/solicitud/create/Solicitud.jsp").forward( request, response); 
//     }
      Bien b= new Bien();


       b.setDescripcion(request.getParameter("descripcion"));
       b.setMarca(request.getParameter("marca"));
       b.setModelo(request.getParameter("modelo"));
       b.setPrecio(Float.parseFloat(request.getParameter("precio")));
       b.setCantidad(Integer.parseInt(request.getParameter("cantidad")));
       b.setNumero(Integer.parseInt(request.getParameter("numserie")));
       return b;

    }
 Solicitud updateSolicitud(HttpServletRequest request) throws ParseException{
     Solicitud s= new Solicitud();
     s.setComprobante(request.getParameter("numcomp"));
     String fecha=request.getParameter("fecha");
     DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
     Date date= format.parse(fecha);
     model.fecha=new SimpleDateFormat("yyyy-MM-dd").format(date);
     s.setFecha(date);
     s.setEstado(request.getParameter("estado"));
     String a=request.getParameter("tipo");
     s.setTipo(request.getParameter("tipo"));
     Usuario us= (Usuario)request.getSession(true).getAttribute("logged");
     Funcionario func=us.getFuncionario();
     s.setDependencia(us.getFuncionario().getDependencia());
     s.setFuncionario(us.getFuncionario());
     return s;
     
 }
 
 protected void consult(HttpServletRequest request, 
                                  HttpServletResponse response)throws Exception{
     try{
         Solicitud s = (Solicitud) SistemaDeActivos.logic.Model.instance().recuperar(Integer.parseInt(request.getParameter("numero")));
       
         
    
         model.sol.setComprobante(s.getComprobante());
         model.sol.setDependencia(s.getDependencia());
         model.sol.setEstado(s.getEstado());
         model.sol.setFecha(s.getFecha());
         model.sol.setFuncionario(s.getFuncionario());
         model.sol.setNumero(s.getNumero());
         model.sol.setTipo(s.getTipo());
         
//         model.sol.setBiens(s.getBiens());
         int si=s.getBiens().size();
         List<Bien> listav2= new ArrayList<Bien>(s.getBiens());
         
         for(Bien b:listav2){
             try {
                model.agregarB(b,b.getNumero());
                HttpSession session=request.getSession(true);
                session.setAttribute("Bienes", model.listar());
                 
            } catch (Exception ex) {      
            }
         }
         
         request.setAttribute("modelSolicitud",model.sol);
            
         request.getRequestDispatcher("/presentation/solicitud/create/Solicitud.jsp").forward( request, response);
        
     }catch(Exception ex){
         
     } 
 }
 
}


//         List<Bien> lista= (List<Bien>) s.getBiens();
//         for(Bien b:lista){
//             try {
//                model.agregarB(b,b.getNumero());
//                HttpSession session=request.getSession(true);
//                session.setAttribute("Bienes", model.listar());
//                 
//            } catch (Exception ex) {      
//            }
//         }