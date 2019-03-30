package SistemaDeActivos.logic;
// Generated 26-Mar-2019 22:32:56 by Hibernate Tools 4.3.1



/**
 * Activo generated by hbm2java
 */
public class Activo  implements java.io.Serializable {


     private int codigo;
     private Bien bien;
     private Categoria categoria;
     private int dependencia;
     private String funcionario;
     private int puesto;

    public Activo() {
    }

    public Activo(int codigo, Bien bien, Categoria categoria, int dependencia, String funcionario, int puesto) {
       this.codigo = codigo;
       this.bien = bien;
       this.categoria = categoria;
       this.dependencia = dependencia;
       this.funcionario = funcionario;
       this.puesto = puesto;
    }
   
    public int getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    public Bien getBien() {
        return this.bien;
    }
    
    public void setBien(Bien bien) {
        this.bien = bien;
    }
    public Categoria getCategoria() {
        return this.categoria;
    }
    
    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    public int getDependencia() {
        return this.dependencia;
    }
    
    public void setDependencia(int dependencia) {
        this.dependencia = dependencia;
    }
    public String getFuncionario() {
        return this.funcionario;
    }
    
    public void setFuncionario(String funcionario) {
        this.funcionario = funcionario;
    }
    public int getPuesto() {
        return this.puesto;
    }
    
    public void setPuesto(int puesto) {
        this.puesto = puesto;
    }




}


