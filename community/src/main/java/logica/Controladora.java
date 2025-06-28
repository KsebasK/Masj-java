
   
// También agrega estos métodos de apoyo:
package logica;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import logica.Visitante;

import persistencias.ControladoraPersistencia;

public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    // Crear usuario
    public void crearUsuario(Usuario usu) {
        controlPersis.crearUsuario(usu);
    }

    // Traer lista de usuarios
    public List<Usuario> traerUsuarios() {
        return controlPersis.traerUsuarios();
    }

    // Eliminar usuario por ID
    public void borrarUsuario(int idEliminar) {
        controlPersis.borrarUsuario(idEliminar);
    }

    // Traer un solo usuario por ID
    public Usuario traerUsuario(int idEditar) {
        return controlPersis.traerUsuario(idEditar);
    }

    // Editar usuario
    public void editarUsuario(Usuario usu) {
        controlPersis.editarUsuario(usu);
    }

    // Validar login
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

    // Encriptar contraseña
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
        Apartamento apartamentoExistente = controlPersis.buscarApartamentoPorTorreYApto(torre, numeroApto);
        if (apartamentoExistente != null) {
            return apartamentoExistente;
        } else {
            Apartamento nuevoApartamento = new Apartamento();
            nuevoApartamento.setTorre(torre);
            nuevoApartamento.setApto(numeroApto);
            controlPersis.crearApartamento(nuevoApartamento);
            return controlPersis.buscarApartamentoPorTorreYApto(torre, numeroApto);
        }
    }

    public List<Apartamento> traerApartamentos() {
        return controlPersis.traerApartamentos();
    }

    public Apartamento buscarApartamentoPorTorreYApto(String torre, String apartamento) {
        return controlPersis.buscarApartamentoPorTorreYApto(torre, apartamento);
    }

    public void crearApartamento(Apartamento apt) {
        controlPersis.crearApartamento(apt);
    }
    
    public Apartamento obtenerApartamentoPorTorreYApto(String torre, String apto) {
    return controlPersis.buscarApartamentoPorTorreYApto(torre, apto);
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
}


//     public List<Apartamento> traerApartamentos() {
//         throw new UnsupportedOperationException("Not supported yet.");
//     }

//     public Apartamento buscarApartamentoPorTorreYApto(String torre, String apartamento) {
//         throw new UnsupportedOperationException("Not supported yet.");
//     }

//     public void crearApartamento(Apartamento apt) {
//         throw new UnsupportedOperationException("Not supported yet.");
//     }

//     public void crearResidente(Residente residente) {
//         throw new UnsupportedOperationException("Not supported yet.");
//     }

