package logica;

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


    
}
