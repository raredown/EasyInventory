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
import es.albarregas.modelo.Marca;
import es.albarregas.modelo.Prestatarios;
import es.albarregas.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafa
 */
@WebServlet(name = "Testing", urlPatterns = {"/Testing"})
public class Testing extends HttpServlet {

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
        Usuario usuario = new Usuario();
        Prestatarios prestatarios = new Prestatarios();
        //Añado  usuario
        usuario.setPasword("albarregas");
        usuario.setTipo("admin");
        usuario.setUsername("jesus1");
        usuario.setIdUsuarios(1);
        prestatarios.setNombre("Jesus");
        prestatarios.setApellido("Nose Nose");
        prestatarios.setTelefono("924670924");
        usuario.setPrestatarios(prestatarios);
        gdao.add(usuario);
        usuario.setPasword("albarregas");
        usuario.setTipo("admin");
        usuario.setUsername("luis");
        prestatarios.setNombre("Luis");
        prestatarios.setApellido("Nose Nose");
        prestatarios.setTelefono("924670923");
        usuario.setPrestatarios(prestatarios);
        gdao.add(usuario);
        usuario.setPasword("asd");
        usuario.setTipo("admin");
        usuario.setUsername("asd");
        prestatarios.setNombre("rafa");
        prestatarios.setApellido("Nose Nose");
        prestatarios.setTelefono("924670924");
        usuario.setPrestatarios(prestatarios);
        gdao.add(usuario);
        usuario.setPasword("albarregas");
        usuario.setTipo("prestatarios");
        usuario.setUsername("manuel");
        prestatarios.setNombre("Manuel");
        prestatarios.setApellido("Marcos Porra");
        prestatarios.setTelefono("924670923");
        usuario.setPrestatarios(prestatarios);
        gdao.add(usuario);
        for (int i = 0; i < 20; i++) {
            usuario.setPasword("albarregas");
            usuario.setTipo("prestatarios");
            usuario.setUsername("usuario" + i);
            prestatarios.setNombre("Usuario" + 1);
            prestatarios.setApellido("Nose Nose");
            prestatarios.setTelefono("924670924");
            usuario.setPrestatarios(prestatarios);
            gdao.add(usuario);

        }

        //Categoria
        Categoria categoria = new Categoria();
        categoria.setNombre("Ordenador");
        gdao.add(categoria);
        categoria.setNombre("Movil");
        gdao.add(categoria);
        categoria.setNombre("Pantalla");
        gdao.add(categoria);
        categoria.setNombre("Altavoces");
        gdao.add(categoria);
        categoria.setNombre("Teclado");
        gdao.add(categoria);
        categoria.setNombre("Raton");
        gdao.add(categoria);

        //Marcas
        Marca marca = new Marca();
        marca.setNombre("Hp");
        gdao.add(marca);
        marca.setNombre("Lenovo");
        gdao.add(marca);
        marca.setNombre("Asus");
        gdao.add(marca);
        marca.setNombre("Mac");
        gdao.add(marca);
        marca.setNombre("KeepOut");
        gdao.add(marca);
        marca.setNombre("Nexus");
        gdao.add(marca);

        //Equipo
        Equipo equipo = new Equipo();

        for (int i = 0; i < 20; i++) {
            equipo.setDemoninacion("equipo" + i);
            equipo.setDescripcion("Descripcion bonitas de los equipo");
            equipo.setNumeroSerie("123456789" + i);
            gdao.add(equipo);
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
