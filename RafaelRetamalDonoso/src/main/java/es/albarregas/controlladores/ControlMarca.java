/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controlladores;

import com.google.gson.Gson;
import es.albarregas.dao.IGenericoDAO;
import es.albarregas.daofactory.DAOFactory;
import es.albarregas.modelo.Marca;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafa
 */
@WebServlet(name = "ControlMarca", urlPatterns = {"/ControlMarca"})
public class ControlMarca extends HttpServlet {

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
        // String json = "{\"idMarca\":46,\"nombre\":\"Miguel\"}";
        String json = request.getParameter("marquita");
        //Añadir una marca nueva
        if (json != null) {
            Marca marca = gson.fromJson(json, Marca.class);
            gdao.add(marca);
        } else if (request.getParameter("getMarcas") != null) {
            ArrayList<Marca> lista = new ArrayList();
            lista = (ArrayList<Marca>) gdao.get("Marca");
            String prueba;
            String representacionJSON = gson.toJson(lista);
            // System.out.print(representacionJSON);
            //response.setCharacterEncoding("UTF-8");
            response.getWriter().write(representacionJSON);
            
        } else if (request.getParameter("borrarMarca") != null) {
            json =request.getParameter("borrarMarca");
            Marca marca = gson.fromJson(json, Marca.class);
            gdao.delete(marca);
        }

        // Marca marca = gson.fromJson(sasd, Marca.class);
        //  marca = (Marca) request.getParameter("marquita");
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
