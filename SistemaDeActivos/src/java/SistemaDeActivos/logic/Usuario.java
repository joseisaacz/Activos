package SistemaDeActivos.logic;
// Generated 26-Mar-2019 22:32:56 by Hibernate Tools 4.3.1



/**
 * Usuario generated by hbm2java
 */
public class Usuario  implements java.io.Serializable {


     private String id;
     private Funcionario funcionario;
     private String clave;
     private String rol;

    public Usuario() {
    }

	
    public Usuario(String id, Funcionario funcionario) {
        this.id = id;
        this.funcionario = funcionario;
    }
    public Usuario(String id, Funcionario funcionario, String clave, String rol) {
       this.id = id;
       this.funcionario = funcionario;
       this.clave = clave;
       this.rol = rol;
    }
   
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    public Funcionario getFuncionario() {
        return this.funcionario;
    }
    
    public void setFuncionario(Funcionario funcionario) {
        this.funcionario = funcionario;
    }
    public String getClave() {
        return this.clave;
    }
    
    public void setClave(String clave) {
        this.clave = clave;
    }
    public String getRol() {
        return this.rol;
    }
    
    public void setRol(String rol) {
        this.rol = rol;
    }




}

