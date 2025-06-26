package persistencias;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

public class ControladoraPersistencia {
    
    // Crear EntityManagerFactory desde persistence.xml
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("PersisteUnitPU");
    
    // Inyectar emf al JpaController
    UsuarioJpaController usuJpa = new UsuarioJpaController(emf);
    
    // CREATE
    public void crearUsuario(Usuario usu){
        usuJpa.create(usu);
    }

    // READ
    public List<Usuario> traerUsuarios(){
        return usuJpa.findUsuarioEntities();
    }

    // DELETE
    public void borrarUsuario(int idEliminar) {
        try {
            usuJpa.destroy(idEliminar);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Usuario traerUsuario(int idEditar) {
        return usuJpa.findUsuario(idEditar);
    }

    public void editarUsuario(Usuario usu) {
    try {
        usuJpa.edit(usu);
    } catch (Exception ex) {
        Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
    }
}
    
    public Usuario validarUsuario(String correo, String contrasenaEncriptada) {
    List<Usuario> lista = this.traerUsuarios();

    for (Usuario usu : lista) {
        if (usu.getCorreoElectronico().equalsIgnoreCase(correo)
                && usu.getContrasena().equals(contrasenaEncriptada)) {
            return usu;
        }
    }

    return null; // No encontrado
}


}
