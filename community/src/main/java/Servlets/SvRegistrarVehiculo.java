/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import logica.Usuario;
import logica.AlquilerParqueadero;
import logica.Controladora;
import logica.Parqueadero;
import logica.Residente;
import logica.Vehiculo;
import logica.Visitante;

@WebServlet(name = "SvRegistrarVehiculo", urlPatterns = {"/SvRegistrarVehiculo"})
public class SvRegistrarVehiculo extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String placa = request.getParameter("placa");
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        String tipoPersona = request.getParameter("tipoPersona"); // "residente" o "visitante"
        String idPersonaStr = request.getParameter("idPersona");
        int idGuardia = Integer.parseInt(request.getParameter("idGuardia"));

        Parqueadero bahiaDisponible = control.obtenerBahiaDisponible();
        if (bahiaDisponible == null) {
        request.setAttribute("error", "No hay bahías disponibles.");
        request.getRequestDispatcher("registrarVehiculo.jsp").forward(request, response);
        return;
        }


        Timestamp now = Timestamp.valueOf(LocalDateTime.now());

        Vehiculo vehiculo = new Vehiculo();
        vehiculo.setPlacaVehiculo(placa);
        vehiculo.setMarcaVehiculo(marca);
        vehiculo.setModeloVehiculo(modelo);
        vehiculo.setBahia(bahiaDisponible);
        vehiculo.setHoraIngreso(now);

        if ("visitante".equalsIgnoreCase(tipoPersona)) {
            int idVisitante = Integer.parseInt(idPersonaStr);
            Visitante visitante = control.buscarVisitante(idVisitante);
            Usuario guardia = control.traerUsuario(idGuardia);
            if (visitante == null || guardia == null) {
                request.setAttribute("error", "Visitante o guardia inválido.");
                request.getRequestDispatcher("registrarVehiculo.jsp").forward(request, response);
                return;
            }

            vehiculo.setVisitante(visitante);
            control.registrarVehiculo(vehiculo); // Registrar vehículo

            AlquilerParqueadero alquiler = new AlquilerParqueadero();
            alquiler.setBahia(bahiaDisponible);
            alquiler.setVisitante(visitante);
            alquiler.setGuardia(guardia);
            alquiler.setFechaIngreso(now);
            alquiler.setFechaSalida(null);
            alquiler.setTotalPago(0);
            control.registrarAlquilerParqueadero(alquiler);

        } else if ("residente".equalsIgnoreCase(tipoPersona)) {
            int idResidente = Integer.parseInt(idPersonaStr);
            Residente residente = control.buscarResidente(idResidente);
            if (residente == null) {
                response.getWriter().print("Residente inválido");
                return;
            }

            vehiculo.setResidente(residente);
            control.registrarVehiculo(vehiculo); // Registrar vehículo

            bahiaDisponible.setFechaEntrada(now);
            bahiaDisponible.setEstado("Ocupado");
            bahiaDisponible.setNovedad("Ninguna");
            control.actualizarParqueadero(bahiaDisponible);
        }

            request.setAttribute("exito", "Vehículo registrado con éxito.");
            request.getRequestDispatcher("registrarVehiculo.jsp").forward(request, response);
    }
}