
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controlladores;

import com.google.gson.Gson;
import es.albarregas.dao.IGenericoDAO;
import es.albarregas.daofactory.DAOFactory;
import es.albarregas.modelo.Equipo;
import es.albarregas.modelo.Incidencia;
import es.albarregas.modelo.Marca;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Gson gson = new Gson();
        DAOFactory daof = DAOFactory.getDAOFactory();
        IGenericoDAO gdao = daof.getGenericoDAO();
        if (request.getParameter("newincidencia") != null) {
            String json = request.getParameter("newincidencia");
             Incidencia incidencia = gson.fromJson(json, Incidencia.class);
            // incidencia
            //Incidencia incidencia = new Incidencia();
            Date fecha = new Date();
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            //java.sql.Date fechaSQL = new java.sql.Date(fecha.getTime());
            //String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
            //Timestamp timestamp = new Timestamp(fecha.getTime());
            incidencia.setCreateDate(timestamp);

            gdao.add(incidencia);

        } else if (request.getParameter("getIncidencia") != null) {
            ArrayList<Incidencia> lista = new ArrayList();
            lista = (ArrayList<Incidencia>) gdao.get("Incidencia");
            String prueba;
            String representacionJSON = gson.toJson(lista);
            // System.out.print(representacionJSON);
            //response.setCharacterEncoding("UTF-8");
            response.getWriter().write(representacionJSON);
            
        }else if (request.getParameter("modincidencia") != null) {
            String json = request.getParameter("modincidencia");
             Incidencia incidencia = gson.fromJson(json, Incidencia.class);
            // incidencia
            //Incidencia incidencia = new Incidencia();
            Date fecha = new Date();
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            //java.sql.Date fechaSQL = new java.sql.Date(fecha.getTime());
            //String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
            //Timestamp timestamp = new Timestamp(fecha.getTime());
            incidencia.setSeResolvio(timestamp);
            incidencia.setEstado("cerrada");

            gdao.add(incidencia);

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

