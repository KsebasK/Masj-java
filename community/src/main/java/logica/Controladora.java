package logica;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

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

    public Usuario traerUsuarios(int idEditar) {
         return controlPersis.traerUsuario(idEditar); }
    


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

    
    
// }

   public Apartamento buscarOCrearApartamento(String torre, String numeroApto) {
    // Primero intentar buscar el apartamento existente
    Apartamento apartamentoExistente = buscarApartamentoPorTorreYApto(torre, numeroApto);
    
    if (apartamentoExistente != null) {
        // Si existe, devolverlo
        return apartamentoExistente;
    } else {
        // Si no existe, crear uno nuevo
        Apartamento nuevoApartamento = new Apartamento();
        nuevoApartamento.setTorre(torre);
        nuevoApartamento.setApto(numeroApto);
        
        // Guardarlo en la base de datos
        crearApartamento(nuevoApartamento);
        
        // Buscarlo nuevamente para obtener el ID generado por la base de datos
        return buscarApartamentoPorTorreYApto(torre, numeroApto);
    }
}

// También agrega estos métodos de apoyo:

public List<Apartamento> traerApartamentos() {
    return controlPersis.traerApartamentos();
}

public Apartamento buscarApartamentoPorTorreYApto(String torre, String apartamento) {
    return controlPersis.buscarApartamentoPorTorreYApto(torre, apartamento);
}

public void crearApartamento(Apartamento apt) {
    controlPersis.crearApartamento(apt);
}
}
