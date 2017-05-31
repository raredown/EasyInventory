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
import javax.annotation.PostConstruct;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
    // private int idPrestatario;

    @OneToOne(cascade = {CascadeType.ALL})
    @JoinColumn(name = "idPrestatarios")
    private Prestatarios prestatarios = new Prestatarios();
//    @Transient
//    private String password2;

    @PostConstruct
    public void init() {

    }

    public Prestatarios getPrestatarios() {
        return prestatarios;
    }

    public void setPrestatarios(Prestatarios prestatarios) {
        this.prestatarios = prestatarios;
    }

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

//    public int getIdPrestatario() {
//        return idPrestatario;
//    }
//
//    public void setIdPrestatario(int idPrestatario) {
//        this.idPrestatario = idPrestatario;
//    }
    public String add() {

        DAOFactory daof = DAOFactory.getDAOFactory();
//        IPersonaDAO adao = daof.getPersonaDAO();
        IGenericoDAO gdao = daof.getGenericoDAO();
        Usuario usuario = new Usuario();
        usuario.setPasword(this.pasword);
        usuario.setUsername(this.username);
        usuario.setIdUsuarios(this.idUsuarios);
        usuario.setTipo("prestatarios");
        Prestatarios aquiprestatario = new Prestatarios();
        aquiprestatario = this.prestatarios;
        usuario.setPrestatarios(aquiprestatario);
        FacesContext context = FacesContext.getCurrentInstance();
        try {
            gdao.add(usuario);
            loggin();

            try {
                FacesContext.getCurrentInstance().getExternalContext().redirect("vista/administrador/panel.jsp");
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
        FacesContext context = FacesContext.getCurrentInstance();

        Usuario usuario = new Usuario();
        lista = (ArrayList<Usuario>) gdao.get("Usuario where username='" + this.username + "'");
        if (!lista.isEmpty()) {
            usuario = lista.get(0);
            if (this.pasword == null ? usuario.getPasword() == null : this.pasword.equals(usuario.getPasword())) {
                try {
                    HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
                    HttpSession session = request.getSession();
                    context.getExternalContext().getSessionMap().put("usuario", usuario);
                    FacesContext.getCurrentInstance().getExternalContext().redirect("vista/administrador/panel.jsp");
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

    public String logout() {
        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();
        return "index?faces-redirect=true";
    }

}
