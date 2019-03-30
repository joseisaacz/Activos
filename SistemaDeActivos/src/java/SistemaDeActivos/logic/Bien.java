package SistemaDeActivos.logic;
// Generated 26-Mar-2019 22:32:56 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Bien generated by hbm2java
 */
public class Bien  implements java.io.Serializable {


     private int numero;
     private Solicitud solicitud;
     private String descripcion;
     private String marca;
     private String modelo;
     private Float precio;
     private Integer cantidad;
     private Set<Activo> activos = new HashSet<Activo>(0);

    public Bien() {
    }

	
    public Bien(int numero, Solicitud solicitud) {
        this.numero = numero;
        this.solicitud = solicitud;
    }
    public Bien(int numero, Solicitud solicitud, String descripcion, String marca, String modelo, Float precio, Integer cantidad, Set<Activo> activos) {
       this.numero = numero;
       this.solicitud = solicitud;
       this.descripcion = descripcion;
       this.marca = marca;
       this.modelo = modelo;
       this.precio = precio;
       this.cantidad = cantidad;
       this.activos = activos;
    }
     public Bien(int numero,String descripcion, String marca, String modelo, Float precio, Integer cantidad){
               this.numero = numero;
       this.descripcion = descripcion;
       this.marca = marca;
       this.modelo = modelo;
       this.precio = precio;
       this.cantidad = cantidad;
      
     }
   
    public int getNumero() {
        return this.numero;
    }
    
    public void setNumero(int numero) {
        this.numero = numero;
    }
    public Solicitud getSolicitud() {
        return this.solicitud;
    }
    
    public void setSolicitud(Solicitud solicitud) {
        this.solicitud = solicitud;
    }
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public String getMarca() {
        return this.marca;
    }
    
    public void setMarca(String marca) {
        this.marca = marca;
    }
    public String getModelo() {
        return this.modelo;
    }
    
    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    public Float getPrecio() {
        return this.precio;
    }
    
    public void setPrecio(Float precio) {
        this.precio = precio;
    }
    public Integer getCantidad() {
        return this.cantidad;
    }
    
    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }
    public Set<Activo> getActivos() {
        return this.activos;
    }
    
    public void setActivos(Set<Activo> activos) {
        this.activos = activos;
    }




}


