package logica;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "residentes")
public class Residente implements Serializable {

    @Id
    @Column(name = "idResidente")
    private int idResidente;

    @OneToOne
    @MapsId
    @JoinColumn(name = "idResidente")
    private Usuario usuario;

    @ManyToOne
    @JoinColumn(name = "idApartamento")
    private Apartamento apartamento;

    // Getters y setters
    public int getIdResidente() {
        return idResidente;
    }

    public void setIdResidente(int idResidente) {
        this.idResidente = idResidente;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Apartamento getApartamento() {
        return apartamento;
    }

    public void setApartamento(Apartamento apartamento) {
        this.apartamento = apartamento;
    }
}
