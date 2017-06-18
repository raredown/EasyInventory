
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controlladores;

import com.google.gson.Gson;
import es.albarregas.dao.IGenericoDAO;
import es.albarregas.daofactory.DAOFactory;
import es.albarregas.modelo.Incidencia;
import es.albarregas.modelo.Usuario;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rretamal
 */
@WebServlet(name = "ControlIncidencia", urlPatterns = {"/ControlIncidencia"})
public class ControlIncidencia extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request depende el request haremos unas cosa o otra
     * @param response servlet response responderemos algunas veces con un json
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Gson gson = new Gson();
        DAOFactory daof = DAOFactory.getDAOFactory();
        IGenericoDAO gdao = daof.getGenericoDAO();
        //En este apartado creamos una nueva incidencia 
        if (request.getParameter("newincidencia") != null) {
            String json = request.getParameter("newincidencia");
            Incidencia incidencia = gson.fromJson(json, Incidencia.class);
            Date fecha = new Date();
            //Cogemos el tiempo del sistema
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            incidencia.setCreateDate(timestamp);
            gdao.add(incidencia);

        } 
        //En este apartado cogemos todas las incidencias 
        else if (request.getParameter("getIncidencia") != null) {
            ArrayList<Incidencia> lista = new ArrayList();
            lista = (ArrayList<Incidencia>) gdao.get("Incidencia");
            String prueba;
            String representacionJSON = gson.toJson(lista);
            response.getWriter().write(representacionJSON);

        }
        //Este apartado sirve para cerrar incidencias
        else if (request.getParameter("modincidencia") != null) {
            String json = request.getParameter("modincidencia");
            Incidencia incidencia = gson.fromJson(json, Incidencia.class);
            Date fecha = new Date();
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            incidencia.setSeResolvio(timestamp);
            incidencia.setEstado("cerrada");

            gdao.add(incidencia);

        } 
        //Traemos un historico de un equipo osea ser todas las incencia que tenga un equipo
        else if (request.getParameter("getHistorico") != null) {
            int idHistorico = Integer.parseInt(request.getParameter("getHistorico"));
            ArrayList<Incidencia> lista = new ArrayList();
            lista = (ArrayList<Incidencia>) gdao.get("Incidencia where equipo.idEquipo =" + idHistorico);
            String prueba;
            String representacionJSON = gson.toJson(lista);
            response.getWriter().write(representacionJSON);

        } 
        //Creamos una incedencia para pedir equipos
        else if (request.getParameter("newpedido") != null) {
            String json = request.getParameter("newpedido");
            Incidencia incidencia = gson.fromJson(json, Incidencia.class);
            HttpSession session = request.getSession();
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            Date fecha = new Date();
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            incidencia.setCreateDate(timestamp);
            incidencia.setPrestatario(usuario.getPrestatarios());
            gdao.add(incidencia);

        } 
        //Todas las incidencia que ha puesto un usuario concreto
        else if (request.getParameter("getIncidenciaUsuario") != null) {
            HttpSession session = request.getSession();
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            ArrayList<Incidencia> lista = new ArrayList();
            lista = (ArrayList<Incidencia>) gdao.get("Incidencia where idPrestatario="+usuario.getPrestatarios().getIdPrestatarios());
            String prueba;
            String representacionJSON = gson.toJson(lista);
            response.getWriter().write(representacionJSON);

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
