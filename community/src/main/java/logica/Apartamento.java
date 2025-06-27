package logica;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "apartamentos")
public class Apartamento implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idApartamentos")
    private int idApartamentos;

    @Column(name = "torre")
    private String torre;

    @Column(name = "apto")
    private String apto;

    // Constructores
    public Apartamento() {}

    public Apartamento(int idApartamentos, String torre, String apto) {
        this.idApartamentos = idApartamentos;
        this.torre = torre;
        this.apto = apto;
    }

    // Getters y Setters
    public int getIdApartamentos() {
        return idApartamentos;
    }

    public void setIdApartamentos(int idApartamentos) {
        this.idApartamentos = idApartamentos;
    }

    public String getTorre() {
        return torre;
    }

    public void setTorre(String torre) {
        this.torre = torre;
    }

    public String getApto() {
        return apto;
    }

    public void setApto(String apto) {
        this.apto = apto;
    }

    @Override
    public String toString() {
        return "Torre " + torre + " - Apto " + apto;
    }
}