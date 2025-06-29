package logica;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import persistencias.ControladoraPersistencia;

public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    // ================= USUARIO =================

    public void crearUsuario(Usuario usu) {
        controlPersis.crearUsuario(usu);
    }

    public List<Usuario> traerUsuarios() {
        return controlPersis.traerUsuarios();
    }

    public void borrarUsuario(int idEliminar) {
        controlPersis.borrarUsuario(idEliminar);
    }

    public Usuario traerUsuario(int idEditar) {
        return controlPersis.traerUsuario(idEditar);
    }

    public void editarUsuario(Usuario usu) {
        controlPersis.editarUsuario(usu);
    }

    public Usuario validarLogin(String correo, String contrasena) {
        List<Usuario> usuarios = controlPersis.traerUsuarios();
        for (Usuario u : usuarios) {
            if (u.getCorreoElectronico().equalsIgnoreCase(correo) &&
                u.getContrasena().equals(contrasena)) {
                return u;
            }
        }
        return null;
    }

    public static String encriptarSHA256(String texto) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(texto.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    // ================= APARTAMENTO =================

    public Apartamento buscarOCrearApartamento(String torre, String numeroApto) {
        Apartamento existente = controlPersis.buscarApartamentoPorTorreYApto(torre, numeroApto);
        if (existente != null) {
            return existente;
        } else {
            Apartamento nuevo = new Apartamento();
            nuevo.setTorre(torre);
            nuevo.setApto(numeroApto);
            controlPersis.crearApartamento(nuevo);
            return controlPersis.buscarApartamentoPorTorreYApto(torre, numeroApto);
        }
    }

    public Apartamento obtenerApartamentoPorTorreYApto(String torre, String apto) {
        return controlPersis.buscarApartamentoPorTorreYApto(torre, apto);
    }

    public List<Apartamento> traerApartamentos() {
        return controlPersis.traerApartamentos();
    }

    public void crearApartamento(Apartamento apt) {
        controlPersis.crearApartamento(apt);
    }

    // ================= VISITANTE =================

    public void registrarVisitante(Visitante visitante) {
        controlPersis.registrarVisitante(visitante);
    }

    public List<Visitante> traerVisitantes() {
        return controlPersis.traerVisitantes();
    }

    public Visitante buscarVisitante(int id) {
        return controlPersis.buscarVisitante(id);
    }

    // NO BORRAR ECHO POR SEBASTIAN PARA VALIDAR QUE LOS USUARIOS CON EL ROL RESIDENTE DE UNA VEZ SE VAYAN A LA TABLA RESIDENTE
    public Usuario traerUsuarioPorCorreo(String correo) {
    return controlPersis.traerUsuarioPorCorreo(correo);
    }

    public void asignarUsuarioComoResidente(Usuario usuario, Apartamento apto) {
    Residente residente = new Residente();
    residente.setIdResidente(usuario.getIdUsuario());
    residente.setUsuario(usuario);
    residente.setApartamento(apto);
    controlPersis.crearResidente(residente);
    }

    public List<Residente> traerResidentes() {
    return controlPersis.traerResidentes();
}

    public Usuario obtenerUsuarioPorApartamento(Apartamento apartamento) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
}

