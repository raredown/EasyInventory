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

        Usuario usuario1 = new Usuario();
        Prestatarios prestatarios1 = new Prestatarios();
        usuario1.setPasword("albarregas");
        usuario1.setTipo("admin");
        usuario1.setUsername("luis");
        prestatarios1.setNombre("Luis");
        prestatarios1.setApellido("Nose Nose");
        prestatarios1.setTelefono("924670923");
        usuario1.setPrestatarios(prestatarios1);
        gdao.add(usuario1);

        Usuario usuario2 = new Usuario();
        Prestatarios prestatarios2 = new Prestatarios();
        usuario2.setPasword("asd");
        usuario2.setTipo("admin");
        usuario2.setUsername("asd");
        prestatarios2.setNombre("rafa");
        prestatarios2.setApellido("Nose Nose");
        prestatarios2.setTelefono("924670924");
        usuario2.setPrestatarios(prestatarios2);
        gdao.add(usuario2);

        Usuario usuario3 = new Usuario();
        Prestatarios prestatarios3 = new Prestatarios();
        usuario3.setPasword("albarregas");
        usuario3.setTipo("prestatarios");
        usuario3.setUsername("manuel");
        prestatarios3.setNombre("Manuel");
        prestatarios3.setApellido("Marcos Porra");
        prestatarios3.setTelefono("924670923");
        usuario3.setPrestatarios(prestatarios3);
        gdao.add(usuario3);
        for (int i = 0; i < 20; i++) {
            Usuario usuario4 = new Usuario();
            Prestatarios prestatarios4 = new Prestatarios();
            usuario4.setPasword("albarregas");
            usuario4.setTipo("prestatarios");
            usuario4.setUsername("usuario" + i);
            prestatarios4.setNombre("Usuario" + 1);
            prestatarios4.setApellido("Nose Nose");
            prestatarios4.setTelefono("924670924");
            usuario4.setPrestatarios(prestatarios4);
            gdao.add(usuario4);

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
