/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controlladores;

import com.google.gson.Gson;
import es.albarregas.dao.IGenericoDAO;
import es.albarregas.daofactory.DAOFactory;
import es.albarregas.modelo.Categoria;
import es.albarregas.modelo.Equipo;
import es.albarregas.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author rafa
 */
@WebServlet(name = "ControlEquipo", urlPatterns = {"/ControlEquipo"})
public class ControlEquipo extends HttpServlet {

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
        //En este apartado añadiremos nuevos equipos
        if (request.getParameter("equipo") != null) {
            //Traaformamos el parametro en un bean equipo y lo añadimos a la bbdd
            String json = request.getParameter("equipo");
            Equipo equipo = gson.fromJson(json, Equipo.class);
            gdao.add(equipo);

        }
        //En este parametro nos traeremos todos los equipo de la bbdd y lo devolveremos en un json
        else if (request.getParameter("getEquipos") != null) {        
            ArrayList<Equipo> lista = new ArrayList();
            lista = (ArrayList<Equipo>) gdao.get("Equipo");
            String representacionJSON = gson.toJson(lista);
            response.getWriter().write(representacionJSON);
            
        }
        // En este apartado le pasamos un equipo y lo borramos de la base de datos
        else if (request.getParameter("borrarEquipo") != null) {
            String json = request.getParameter("borrarEquipo");
            Equipo equipo = gson.fromJson(json, Equipo.class);
            equipo.setMarca(null);
            equipo.setCategoria(null);
            gdao.delete(equipo);
        }
        //Aqui devolvemos todos los equipos que esten libres
        else if (request.getParameter("getEquiposLibres") != null) {
            ArrayList<Equipo> lista = new ArrayList();
            lista = (ArrayList<Equipo>) gdao.get("Equipo where idPrestatario=null");
            String representacionJSON = gson.toJson(lista);
            response.getWriter().write(representacionJSON);
            
        } 
        //Aqui devolvemos todos los equipo de un usuario
        else if (request.getParameter("getEquiposUsuario") != null) {
            HttpSession session = request.getSession();
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            ArrayList<Equipo> lista = new ArrayList();
            lista = (ArrayList<Equipo>) gdao.get("Equipo where idPrestatario="+usuario.getPrestatarios().getIdPrestatarios());
            String representacionJSON = gson.toJson(lista);
            // System.out.print(representacionJSON);
            //response.setCharacterEncoding("UTF-8");
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
