/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SistemaDeActivos.presentation.solicitud;

import SistemaDeActivos.logic.Bien;
import SistemaDeActivos.logic.Solicitud;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


/**
 *
 * @author admin
 */
public class Model {

  
   HashMap<Integer,Bien> bienes;
   Solicitud sol;
   String fecha;
   
   public Model(){
       sol=new Solicitud();
      
       bienes = new HashMap();
   }
   
   public void agregarBien(int num, String desc, String mod,String marc ,float precio, int cant){
       Bien b= new Bien(num,desc,mod,marc,precio,cant);
       bienes.put(num, b);
       
   }
   
    public void agregarB(Bien b,int num){
       bienes.put(num, b);
       
   }
    public  List<Bien> listar(){
        return new ArrayList(bienes.values());
    }
    public HashMap<Integer,Bien> getBienes(){
        return this.bienes;
    }
    public void setSolicitud(Solicitud s){
        this.sol=s;
    }
    public Solicitud getSolicitud(){
        return this.sol;
    }
}
