package logica;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "quejas")
public class QuejaResidente implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idQueja")
    private int idQueja;

    @Temporal(TemporalType.DATE)
    @Column(name = "FechaQueja")
    private Date fechaQueja;

    @Column(name = "MotivoQueja", nullable = false)
    private String motivoQueja;

    @Column(name = "EstadoQueja", nullable = false)
    private String estadoQueja;

    @ManyToOne
    @JoinColumn(name = "idResidente")
    private Residente residente;

    @ManyToOne
    @JoinColumn(name = "idAdministrador")
    private Usuario administrador;

    public QuejaResidente() {
    }

    public QuejaResidente(Date fechaQueja, String motivoQueja, String estadoQueja, Residente residente, Usuario administrador) {
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
