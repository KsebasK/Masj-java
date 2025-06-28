/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Servlets;

import java.io.IOException;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import logica.Controladora;
import logica.Visitante;

@WebServlet(name = "SvRegistrarVisitante", urlPatterns = {"/SvRegistrarVisitante"})
public class SvRegistrarVisitante extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener datos del formulario
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String tipoDoc = request.getParameter("tipoDoc");
        int numDoc = Integer.parseInt(request.getParameter("numDoc"));
        int idResidente = Integer.parseInt(request.getParameter("idResidente"));
        int idGuardia = Integer.parseInt(request.getParameter("idGuardia"));
        int idApartamento = Integer.parseInt(request.getParameter("idApartamento"));

        // Crear objeto Visitante
        Visitante visitante = new Visitante();
        visitante.setNombresVisitante(nombres);
        visitante.setApellidosVisitante(apellidos);
        visitante.setTipoDocumento(tipoDoc);
        visitante.setNumDocumento(numDoc);
        visitante.setIdResidente(idResidente);
        visitante.setIdGuardia(idGuardia);
        visitante.setIdApartamento(idApartamento);
        visitante.setHoraEntrada(new Date()); // hora actual

        // Usar la lógica para guardar en la BD
        Controladora control = new Controladora();
        control.registrarVisitante(visitante);

        // Redireccionar o mostrar mensaje
        response.sendRedirect("guardia.jsp"); // o la página que prefieras
    }
}