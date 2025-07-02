package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "quejas")
public class QuejaEntity implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idQueja")
    private int idQueja;

    @Temporal(TemporalType.DATE)
    @Column(name = "FechaQueja", nullable = false)
    private Date fechaQueja;

    @Column(name = "MotivoQueja", nullable = false, columnDefinition = "TEXT")
    private String motivoQueja;

    @Column(name = "EstadoQueja", nullable = false)
    private String estadoQueja;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idResidente", nullable = false)
    private Residente residente;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idAdministrador", nullable = false)
    private Usuario administrador;

    // Constructor vacío necesario para JPA
    public QuejaEntity() {}

    // Constructor útil si deseas instanciarla desde el servicio
    public QuejaEntity(Date fechaQueja, String motivoQueja, String estadoQueja, Residente residente, Usuario administrador) {
        this.fechaQueja = fechaQueja;
        this.motivoQueja = motivoQueja;
        this.estadoQueja = estadoQueja;
        this.residente = residente;
        this.administrador = administrador;
    }

    // Getters y Setters
    public int getIdQueja() {
        return idQueja;
    }

    public void setIdQueja(int idQueja) {
        this.idQueja = idQueja;
    }

    public Date getFechaQueja() {
        return fechaQueja;
    }

    public void setFechaQueja(Date fechaQueja) {
        this.fechaQueja = fechaQueja;
    }

    public String getMotivoQueja() {
        return motivoQueja;
    }

    public void setMotivoQueja(String motivoQueja) {
        this.motivoQueja = motivoQueja;
    }

    public String getEstadoQueja() {
        return estadoQueja;
    }

    public void setEstadoQueja(String estadoQueja) {
        this.estadoQueja = estadoQueja;
    }

    public Residente getResidente() {
        return residente;
    }

    public void setResidente(Residente residente) {
        this.residente = residente;
    }

    public Usuario getAdministrador() {
        return administrador;
    }

    public void setAdministrador(Usuario administrador) {
        this.administrador = administrador;
    }
}
