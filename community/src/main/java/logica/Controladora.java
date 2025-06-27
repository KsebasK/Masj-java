package logica;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import persistencias.*;

public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    UsuarioJpaController usuarioJpa = new UsuarioJpaController();
    ApartamentoJpaController apartamentoJpa = new ApartamentoJpaController();
    ResidenteJpaController residenteJpa = new ResidenteJpaController();

    // Crear usuario simple
    public void crearUsuario(Usuario usu) {
        controlPersis.crearUsuario(usu);
    }

    // Crear usuario y residente (si aplica)
    public void crearUsuarioConResidente(Usuario usu, int idApartamento) throws Exception {
        usuarioJpa.create(usu); // Guardar usuario

        // Buscar apartamento
        Apartamento apto = apartamentoJpa.findApartamento(idApartamento);

        // Crear residente
        Residente res = new Residente();
        res.setIdResidente(usu.getIdUsuario());
        res.setUsuario(usu);
        res.setApartamento(apto);

        residenteJpa.create(res); // Guardar residente
    }

    // Listar usuarios
    public List<Usuario> traerUsuarios() {
        return controlPersis.traerUsuarios();
    }

    // Obtener usuario por ID
    public Usuario traerUsuario(int idEditar) {
        return controlPersis.traerUsuario(idEditar);
    }

    public Usuario traerUsuarios(int idEditar) {
        return controlPersis.traerUsuario(idEditar);
    }

    // Editar
    public void editarUsuario(Usuario usu) {
        controlPersis.editarUsuario(usu);
    }

    // Eliminar
    public void borrarUsuario(int idEliminar) {
        controlPersis.borrarUsuario(idEliminar);
    }

    // Validar login
    public Usuario validarLogin(String correo, String contrasena) {
        List<Usuario> usuarios = controlPersis.traerUsuarios();
        for (Usuario u : usuarios) {
            if (u.getCorreoElectronico().equalsIgnoreCase(correo)
                    && u.getContrasena().equals(contrasena)) {
                return u;
            }
        }
        return null;
    }

    // Encriptación SHA-256
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

    // ===== MÉTODOS ADICIONALES OPCIONALES ====

    public List<Apartamento> traerApartamentos() {
        return apartamentoJpa.findApartamentoEntities();
    }

    public Apartamento buscarApartamento(int id) {
        return apartamentoJpa.findApartamento(id);
    }

    public void crearApartamento(Apartamento apto) {
        try {
            apartamentoJpa.create(apto);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void crearResidente(Residente res) {
        try {
            residenteJpa.create(res);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Residente> traerResidentes() {
        return residenteJpa.findResidenteEntities();
    }
    
    public int buscarIdApartamentoPorTorreYApto(String torre, String apartamento) {
    Apartamento apto = apartamentoJpa.findByTorreYApto(torre, apartamento);
    return apto != null ? apto.getIdApartamento() : 0;
}

}
