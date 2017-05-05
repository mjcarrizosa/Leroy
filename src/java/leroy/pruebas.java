/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package leroy;



/**
 *
 * @author Mario
 */
public class pruebas {
    public static void main(String args[]){
        try {
            Fichero f = new Fichero("ejemplo.bin","ab");
            Producto alum = new Producto("Raul","Perez",33);
            f.escribirObjeto(alum);
        } catch (AperturaFicheroExcepcion ex) {
            System.out.println("Error en la apertura");
        }
       
        Fichero f;
        try {
            f = new Fichero("ejemplo.bin","rb");
            Producto alum = (Producto)f.leerObjeto();
            while(alum!=null){
              
                System.out.println(alum.toString());
                //respuesta+=aux.toString();
                   
                    
                alum = (Producto) f.leerObjeto();
            }
        }catch (AperturaFicheroExcepcion ex) {
            System.err.println(ex.getMessage());
        }    
    }
}
