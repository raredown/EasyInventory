/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.modelo;

import es.albarregas.dao.IGenericoDAO;
import es.albarregas.daofactory.DAOFactory;
import java.io.Serializable;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author rafa
 */

 @ManagedBean
@RequestScoped
@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int idUsuarios;
    private String username;
    private String pasword;
    private String tipo;
    private int idPrestatario;

    public int getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(int idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPasword() {
        return pasword;
    }

    public void setPasword(String pasword) {
        this.pasword = pasword;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getIdPrestatario() {
        return idPrestatario;
    }

    public void setIdPrestatario(int idPrestatario) {
        this.idPrestatario = idPrestatario;
    }
    public void add(){
    
         DAOFactory daof = DAOFactory.getDAOFactory();
//        IPersonaDAO adao = daof.getPersonaDAO();
        IGenericoDAO gdao = daof.getGenericoDAO();
        Usuario usuario = new Usuario();
        usuario.setPasword(this.pasword);
        usuario.setUsername(this.username);
        usuario.setIdUsuarios(this.idUsuarios);
        gdao.add(usuario);
        
    
    }
    

}
