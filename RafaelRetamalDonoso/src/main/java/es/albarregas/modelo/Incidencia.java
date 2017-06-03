
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.modelo;

import java.io.Serializable;
import java.sql.Date;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author rretamal
 */
@Entity
@Table(name = "incidencia")
public class Incidencia implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idIncidencia;

    private Date fechaCreacion;
    private Date fechaTerminacion;

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public Date getFechaTerminacion() {
        return fechaTerminacion;
    }

    public void setFechaTerminacion(Date fechaTerminacion) {
        this.fechaTerminacion = fechaTerminacion;
    }


    private String tipo;
    private String estado;
    @OneToOne(cascade = {CascadeType.PERSIST})
    @JoinColumn(name = "idPrestatario")
    private Prestatarios prestatario = new Prestatarios();

    @OneToOne(cascade = {CascadeType.PERSIST})
    @JoinColumn(name = "idEquipo")
    private Equipo equipo = new Equipo();

    public Equipo getEquipo() {
        return equipo;
    }

    public void setEquipo(Equipo equipo) {
        this.equipo = equipo;
    }

    public int getIdIncidencia() {
        return idIncidencia;
    }

    public void setIdIncidencia(int idIncidencia) {
        this.idIncidencia = idIncidencia;
    }
    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Prestatarios getPrestatario() {
        return prestatario;
    }

    public void setPrestatario(Prestatarios prestatario) {
        this.prestatario = prestatario;
    }

}