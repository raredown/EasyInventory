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
import java.io.IOException;
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
@WebServlet(name = "ControlCategoria", urlPatterns = {"/ControlCategoria"})
public class ControlCategoria extends HttpServlet {

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
        //Compramos si nos llega un parametro para crear la nueva categoría
        if (request.getParameter("newcategoria") != null) {
            String json = request.getParameter("newcategoria");
            //Transformamo la categoria que viene por request ha  nuestro bean categoria
            Categoria categoria = gson.fromJson(json, Categoria.class);
            //Añadimos a la bbdd
            gdao.add(categoria);

        }
        //En este parametro lo que hacemos es traernos toda las categorias
        else if (request.getParameter("getCategoria") != null) {
            ArrayList<Categoria> lista = new ArrayList();
            lista = (ArrayList<Categoria>) gdao.get("Categoria");
            String prueba;
            //Transformamos toda la lista de categoria ha json
            String representacionJSON = gson.toJson(lista);
            //devolvemos la lista en json
            response.getWriter().write(representacionJSON);

        } 
        //Este apartado es en el cual entraremos para borrar categoria
        else if (request.getParameter("borrarCategoria") != null) {
            String json = request.getParameter("borrarCategoria");
            Categoria categoria = gson.fromJson(json, Categoria.class);
            gdao.delete(categoria);
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
