package SistemaDeActivos.logic;
// Generated 26-Mar-2019 22:32:56 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Categoria generated by hbm2java
 */
public class Categoria  implements java.io.Serializable {


     private int categoria;
     private String descripcion;
     private Integer consecutivo;
     private Set<Activo> activos = new HashSet<Activo>(0);

    public Categoria() {
    }

	
    public Categoria(int categoria, String descripcion) {
        this.categoria = categoria;
        this.descripcion = descripcion;
    }
    public Categoria(int categoria, String descripcion, Integer consecutivo, Set<Activo> activos) {
       this.categoria = categoria;
       this.descripcion = descripcion;
       this.consecutivo = consecutivo;
       this.activos = activos;
    }
   
    public int getCategoria() {
        return this.categoria;
    }
    
    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public Integer getConsecutivo() {
        return this.consecutivo;
    }
    
    public void setConsecutivo(Integer consecutivo) {
        this.consecutivo = consecutivo;
    }
    public Set<Activo> getActivos() {
        return this.activos;
    }
    
    public void setActivos(Set<Activo> activos) {
        this.activos = activos;
    }




}


