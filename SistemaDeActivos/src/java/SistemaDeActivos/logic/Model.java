/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SistemaDeActivos.logic;

/**
 *
 * @author admin
 */
import Util.HibernateUtil;
    import static java.sql.JDBCType.NULL;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.TableModel;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Bran
 */
public class Model {
    Session ses;
     
    private static Model uniqueInstance;
    
    public static Model instance(){
        if (uniqueInstance == null){
            uniqueInstance = new Model();
        }
        return uniqueInstance; 
    }
    
    private Model(){
        ses = HibernateUtil.getSessionFactory().openSession();
    }
    public  Usuario getUsuario(String id, String clave) throws Exception{
        Usuario u = (Usuario) ses.get(Usuario.class, id);
        if(u==null)  throw new Exception ("Usuario no existe");
        if (u.getClave().equals(clave)){
           
            Hibernate.initialize(u.getFuncionario());
            Hibernate.initialize(u.getFuncionario().getDependencias());
            ses.evict(u);
            return u;
        }
        else{
            throw new Exception ("Clave incorrecta");
        }
    }
     public List<Categoria> recuperarCategorias() {
        Query query = ses.createQuery("from Categoria");
        return query.list();
    }
       public void agregarSolicitud(Solicitud solicitud){
        Transaction t = ses.beginTransaction();
        ses.persist(solicitud);
        t.commit();        
    }
         public List<Solicitud> recuperarSolicitudes() {
        Query query = ses.createQuery("from Solicitud");
        return query.list();
    }
    
}

