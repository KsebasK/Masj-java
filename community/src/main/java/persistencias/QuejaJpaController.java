package persistencias;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import logica.QuejaEntity;
import logica.Residente;
import logica.Usuario;

public class QuejaJpaController {

    private EntityManagerFactory emf = Persistence.createEntityManagerFactory("masjPU");

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void crearQueja(QuejaEntity q) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(q);
            em.getTransaction().commit();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            throw ex;
        } finally {
            em.close();
        }
    }

    // ➕ Métodos auxiliares para buscar residente y administrador
    public Residente obtenerResidentePorId(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Residente.class, id);
        } finally {
            em.close();
        }
    }

    public Usuario obtenerAdministradorPorId(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Usuario.class, id);
        } finally {
            em.close();
        }
    }
}
