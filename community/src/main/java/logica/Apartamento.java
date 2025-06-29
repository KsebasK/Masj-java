package logica;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "apartamentos")
public class Apartamento implements Serializable {

  @Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "idApartamentos")
private int idApartamento;

@Column(name = "torre")
private String torre;

@Column(name = "apto")
private String apto;

public Apartamento() {}

public Apartamento(int idApartamento, String torre, String apto) {
    this.idApartamento = idApartamento;
    this.torre = torre;
    this.apto = apto;
}

public int getIdApartamento() {
    return idApartamento;
}

public void setIdApartamento(int idApartamento) {
    this.idApartamento = idApartamento;
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
}