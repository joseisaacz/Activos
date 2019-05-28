/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SistemaDeActivos.logic;

import Util.HibernateUtil;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.Session;
/**
 *
 * @author admin
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
     public  Usuario getUsuarioID(String id) throws Exception{
        Usuario u = (Usuario) ses.get(Usuario.class, id);
        if(u==null)  throw new Exception ("Usuario no existe");
       
           
            Hibernate.initialize(u.getFuncionario());
            Hibernate.initialize(u.getFuncionario().getDependencias());
            ses.evict(u);
            return u;
       
    }
     public Funcionario getFuncionario(String id) throws Exception{
         Funcionario f= (Funcionario) ses.get(Funcionario.class,id);
         if(f==null) throw new Exception("Funcionario no existe");
         Hibernate.initialize(f.getDependencia());
         Hibernate.initialize(f.getDependencias());
         Hibernate.initialize(f.getSolicituds());
         Hibernate.initialize(f.getUsuarios());
        return f;
     }
     public List<Categoria> recuperarCategorias() {
        Query query = ses.createQuery("from Categoria");
        return query.list();
    }
       public void agregarSolicitud(Solicitud solicitud){

        Transaction t = ses.beginTransaction();
        ses.save(solicitud);
        
         t.commit(); 
                 
                for(Bien b: solicitud.getBiens()){
            this.agregarBien(b);
        }
    }
       public void agregarBien(Bien bien){
        Transaction t = ses.beginTransaction();
        ses.persist(bien);
        t.commit();        
    }
        public void agregarDependencia(Dependencia d){
        Transaction t = ses.beginTransaction();
        ses.persist(d);
        t.commit();        
    }
         public List<Usuario> UsuariosRegistradores() {
        Query query = ses.createQuery("from Usuario u where u.rol= 'Registrador'");
        return query.list();
    }
     
          public void agregarFuncionario(Funcionario f){
        Transaction t = ses.beginTransaction();
        ses.persist(f);
        t.commit();        
    }
          
              public void agregarCategoria(Categoria c){
        Transaction t = ses.beginTransaction();
        ses.persist(c);
        t.commit();        
    }
                        public void agregarActivo(Activo  a){
        Transaction t = ses.beginTransaction();
        ses.persist(a);
        t.commit();        
    }


            public List<Solicitud> recuperarSolicitudes() {
        Query query = ses.createQuery("from Solicitud");
        return query.list();
    }
            
                     public List<Dependencia> recuperarDependencias() {
        Query query = ses.createQuery("from Dependencia");
        //Hibernate.initialize();
        return query.list();
        
    }
                     
         public void eliminarFuncionario(Funcionario seleccionada) throws Exception {
        List<Activo> activos=this.recuperarActivos();
        for(Activo p: activos){
            if(p.getFuncionario().equals(seleccionada))
                throw new Exception("Error, el funcionario tiene un activo asociado");
        }
        Transaction t = ses.beginTransaction();
        ses.delete(seleccionada);
        t.commit();
    } 
                public void eliminarCategoria(Categoria seleccionada) throws Exception {
        List<Activo> activos=this.recuperarActivos();
        for(Activo p: activos){
            if(p.getCategoria().equals(seleccionada))
                throw new Exception("Error, la categoria tiene un activo asociado");
        }
        Transaction t = ses.beginTransaction();
        ses.delete(seleccionada);
        t.commit();
    } 
      public void eliminarDependencia(Dependencia seleccionada) throws Exception {
        List<Funcionario> funcionarios=this.recuperarFuncionarios();
        for(Funcionario p: funcionarios){
            if(p.getDependencia().equals(seleccionada))
                throw new Exception("Error, la dependencia tiene un funcionario asociado");
        }
        Transaction t = ses.beginTransaction();
        ses.delete(seleccionada);
        t.commit();
    } 
    
    public List<Solicitud> recuperarSolicitudAdministrador(int codigoDependencia) {
        Query query = ses.createQuery("from Solicitud s where s.dependencia = :codigo");
        query.setInteger("codigo",codigoDependencia);
        return query.list();
    }
    
        public List<Activo> recuperarActivos() {
        Query query = ses.createQuery("from Activo");
        return query.list();
    }
              public List<Activo> recuperarActivosXCodigo(String cod) {
        Query query = ses.createQuery("from Activo where codigo like :cod");
        query.setString("cod", cod);
        return query.list();
    }
                            public List<Activo> recuperarActivosXFuncionario(String fun) {
                        Query query = ses.createSQLQuery(
                "select * from activo a inner join funcionario f on a.funcionario=f.id where f.nombre like :fun")
                .addEntity(Activo.class)
                .setParameter("fun",'%'+fun+'%');

          return query.list();
    }
      public List<Activo> recuperarActivosXCategoria(String cat) {
                        Query query = ses.createSQLQuery(
                "select * from activo a inner join categoria c on a.categoria=c.categoria where c.descripcion like :cat")
                .addEntity(Activo.class)
                .setParameter("cat",'%'+cat+'%');
          return query.list();
    }
        public List<Activo> recuperarActivosXDependencia(String dep) {
                        Query query = ses.createSQLQuery(
                "select * from activo a inner join dependencia d on a.dependencia=d.codigo where d.nombre like :dep")
                .addEntity(Activo.class)
                .setParameter("dep",'%'+dep+'%');

          return query.list();
    }
 
    
      public List<Funcionario> recuperarFuncionariosXDependencias(int codigoDependencia) {
        Query query = ses.createQuery("from Funcionario f where f.dependencia = :codigo");
        query.setInteger("codigo",codigoDependencia);
        return query.list();
    }

     public List<Solicitud> recuperarSolicitudSecretaria() {
        Query query = ses.createQuery("from Solicitud s where s.estado= 'Enviado al Sistema'");
        return query.list();
    }
          public List<Solicitud> recuperarSolicitudSecretariaTodas() {
        Query query = ses.createQuery("from Solicitud s where s.estado= 'Enviado al Sistema' or s.estado='Rechazada' or s.estado='En espera de aprobacion'");
        return query.list();
    }
     
       public List<Solicitud> recuperarSolicitudSecretariaRechazadas() {
        Query query = ses.createQuery("from Solicitud s where s.estado= 'Rechazada'");
        return query.list();
    }
            public List<Solicitud> recuperarSolicitudSecretariaPorVerificar() {
        Query query = ses.createQuery("from Solicitud s where s.estado= 'En espera de aprobacion'");
        return query.list();
    }
                       public List<Solicitud> recuperarSolicitudXNumero(int num) {
        Query query = ses.createQuery("from Solicitud s where s.numero like :numero");
        query.setInteger("numero", num);
        return query.list();
    }
            
     
      public List<Solicitud> recuperarSolicitudRegistrador(Funcionario f) {
        Query query = ses.createQuery("from Solicitud s where s.estado= 'Asignada a registrador'" + " and s.funcionario= :id");
        query.setString("id",f.getId());
        return query.list();
    }
          public List<Solicitud> recuperarSolicitudRegistradorV2(Funcionario f) {
        Query query = ses.createQuery("from Solicitud s where s.estado= 'En espera de rotulacion'" + " and s.funcionario= :id");
        query.setString("id",f.getId());
        return query.list();
    }
          
                  public List<Activo> recuperarActivosRotular(Bien b) {
        Query query = ses.createQuery("from Activo where bien=:numero" + " and funcionario=null");
        query.setInteger("numero",b.getNumero());
        return query.list();
    }
     
          public List<Solicitud> recuperarSolicitudJefe() {
        Query query = ses.createQuery("from Solicitud s where s.estado= 'En espera de aprobacion'");
        return query.list();
    }
     

             public void actualizarSolicitud(Solicitud solicitud){
        Transaction t = ses.beginTransaction();
        ses.merge(solicitud);
        t.commit();        
    }  
                    public void actualizaCategoria(Categoria c){
        Transaction t = ses.beginTransaction();
        ses.merge(c);
        t.commit();        
    }  
             
                        public void actualizarDependencia(Dependencia dep){
        Transaction t = ses.beginTransaction();
        ses.merge(dep);
        t.commit();        
    }  
        
         public Solicitud recuperar(int i)throws Exception{
                 try{
        Solicitud s = (Solicitud) ses.get(Solicitud.class, i);
        Hibernate.initialize(s.getBiens());
        Hibernate.initialize(s.getDependencia());
        Hibernate.initialize(s.getFuncionario());
        ses.evict(s);
        return s;
         }
         catch(Exception e){
                String ex=e.getMessage();
         }
           return null;      
         }
         
         
              public Activo recuperarActivo(int i)throws Exception{
         
       Activo s = (Activo) ses.get(Activo.class, i);
        Hibernate.initialize(s.getBien());
        Hibernate.initialize(s.getCategoria());

       // Hibernate.initialize(s.getFuncionario());
        ses.evict(s);
        return s;
         }
              public Activo recuperarActivoCompleto(int i)throws Exception{
              
                Activo s = (Activo) ses.get(Activo.class, i);
        Hibernate.initialize(s.getBien());
        Hibernate.initialize(s.getCategoria());
        Hibernate.initialize(s.getDependencia());
           Hibernate.initialize(s.getFuncionario());
       // Hibernate.initialize(s.getFuncionario());
        ses.evict(s);
        return s;
              }
         
         public Bien recuperarBien(int num){
             try{
             Bien b = (Bien) ses.get(Bien.class, num);
             Hibernate.initialize(b.getSolicitud());
             Hibernate.initialize(b.getActivos());
             return b;
             }
             catch(Exception e){
                 
             }
             return null;
         }
           public Categoria recuperarCategoria(int num){
             try{
             Categoria c = (Categoria)ses.get(Categoria.class, num);
             
             Hibernate.initialize(c.getActivos());
             return c;
             }
             catch(Exception e){
                 
             }
             return null;
         }
           
           
           public Dependencia recuperarDependencia(int cod){
      
             Dependencia c = (Dependencia)ses.get(Dependencia.class, cod);
             
             Hibernate.initialize(c.getActivos());
             return c;

             
         }
           
           
           
           
                       public void actualizarCategoria(Categoria c){
        Transaction t = ses.beginTransaction();
        ses.merge(c);
        t.commit();    
        
    }
                       
                                             public void actualizarActivo(Activo a){
        Transaction t = ses.beginTransaction();
        ses.merge(a);
        t.commit();    
        
    }
                                             
                                                              
        public void actualizarFuncionario(Funcionario a){
        Transaction t = ses.beginTransaction();
        ses.merge(a);
        t.commit();    
        
    }
           public List<Funcionario> recuperarFuncionarios() {
        Query query = ses.createQuery("from Funcionario");
        return query.list();
           }
}


