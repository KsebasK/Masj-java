package persistencias;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import logica.Apartamento;
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

public List<Apartamento> traerApartamentos() {
    EntityManager em = getEntityManager();
    try {
        Query query = em.createQuery("SELECT a FROM Apartamento a");
        return query.getResultList();
    } finally {
        em.close();
    }
}

public Apartamento buscarApartamentoPorTorreYApto(String torre, String apartamento) {
    EntityManager em = getEntityManager();
    try {
        Query query = em.createQuery("SELECT a FROM Apartamento a WHERE a.torre = :torre AND a.apto = :apartamento");
        query.setParameter("torre", torre);
        query.setParameter("apartamento", apartamento);
        
        List<Apartamento> resultados = query.getResultList();
        if (resultados.isEmpty()) {
            return null;
        } else {
            return resultados.get(0);
        }
    } catch (Exception e) {
        e.printStackTrace();
        return null;
    } finally {
        em.close();
    }
}

public void crearApartamento(Apartamento apt) {
    EntityManager em = getEntityManager();
    try {
        em.getTransaction().begin();
        em.persist(apt);
        em.getTransaction().commit();
    } catch (Exception e) {
        if (em.getTransaction().isActive()) {
            em.getTransaction().rollback();
        }
        e.printStackTrace();
        throw new RuntimeException("Error al crear apartamento: " + e.getMessage());
    } finally {
        em.close();
    }
}

/**
 * Devuelve una nueva instancia de EntityManager.
 */
private EntityManager getEntityManager() {
    return emf.createEntityManager();
}

}
