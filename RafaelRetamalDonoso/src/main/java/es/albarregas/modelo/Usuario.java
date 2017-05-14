/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.modelo;

import es.albarregas.dao.IGenericoDAO;
import es.albarregas.daofactory.DAOFactory;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int idUsuarios;
    @Column(unique = true)
    private String username;
    private String pasword;
    private String tipo;
    private int idPrestatario;
//    @Transient
//    private String password2;

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

    public String add() {

        DAOFactory daof = DAOFactory.getDAOFactory();
//        IPersonaDAO adao = daof.getPersonaDAO();
        IGenericoDAO gdao = daof.getGenericoDAO();
        Usuario usuario = new Usuario();
        usuario.setPasword(this.pasword);
        usuario.setUsername(this.username);
        usuario.setIdUsuarios(this.idUsuarios);
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            gdao.add(usuario);

            try {
                FacesContext.getCurrentInstance().getExternalContext().redirect("page1.xhtml");
            } catch (IOException ex) {
                Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (Exception e) {
            context.addMessage(null, new FacesMessage("Fallo", "Usuario ya existe"));
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, e);
        }
        return "success";

    }

    public void loggin() {
        DAOFactory daof = DAOFactory.getDAOFactory();
//        IPersonaDAO adao = daof.getPersonaDAO();
        IGenericoDAO gdao = daof.getGenericoDAO();
        ArrayList<Usuario> lista = new ArrayList();

        Usuario usuario = new Usuario();
        lista = (ArrayList<Usuario>) gdao.get("Usuario where username='" + this.username + "'");
        if (!lista.isEmpty()) {
            usuario = lista.get(0);
            if (this.pasword == null ? usuario.getPasword() == null : this.pasword.equals(usuario.getPasword())) {
                try {
                    FacesContext.getCurrentInstance().getExternalContext().redirect("page1.xhtml");
                } catch (IOException ex) {
                    Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Fallo", "Contraseña incorrecta"));
            }
        } else {
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage("Fallo", "Usuario no existe"));
        }

    }

}
