/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.modelo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author rafa
 */
@Entity
@Table(name = "equipo")
public class Equipo implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idEquipo;
    private String demoninacion;
    private String descripcion;
    private String numeroSerie;

    public int getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(int idEquipo) {
        this.idEquipo = idEquipo;
    }

    public String getDemoninacion() {
        return demoninacion;
    }

    public void setDemoninacion(String demoninacion) {
        this.demoninacion = demoninacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNumeroSerie() {
        return numeroSerie;
    }

    public void setNumeroSerie(String numeroSerie) {
        this.numeroSerie = numeroSerie;
    }
    
    
}
