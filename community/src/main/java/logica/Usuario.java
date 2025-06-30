package logica;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUsuario")
    private int idUsuario;

    @Column(name = "PrimerNombre", nullable = false)
    private String primerNombre;

    @Column(name = "SegundoNombre")
    private String segundoNombre;

    @Column(name = "PrimerApellido", nullable = false)
    private String primerApellido;

    @Column(name = "SegundoApellido")
    private String segundoApellido;

    @Column(name = "NumeroCelular", nullable = false)
    private String numeroCelular;

    @Column(name = "CorreoElectronico", nullable = false)
    private String correoElectronico;

    @Column(name = "Contrasena", nullable = false)
    private String contrasena;

    @Column(name = "FechaNacimiento", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date fechaNacimiento;

    @Enumerated(EnumType.STRING)
    @Column(name = "rol", nullable = false)
    private Rol rol;

    @Column(name = "TipoDocumento", nullable = false)
    private String tipoDocumento;

    @Column(name = "NumDocumento", nullable = false)
    private int numDocumento;

    @ManyToOne
    @JoinColumn(name = "idApartamentos")
    private Apartamento apartamentos;

    public void setApartamento(Apartamento aptoExistente) {
        this.apartamentos = aptoExistente;
    }

    public enum Rol {
        arrendatario, guardia, administrador, inactivo;

        @Override
        public String toString() {
            return this.name().toLowerCase();
        }
    }

    public Usuario() {}

    public Usuario(int idUsuario, String primerNombre, String segundoNombre, String primerApellido, String segundoApellido,
                   String numeroCelular, String correoElectronico, String contrasena,
                   Date fechaNacimiento, Rol rol, String tipoDocumento, int numDocumento, Apartamento apartamentos) {
        this.idUsuario = idUsuario;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.numeroCelular = numeroCelular;
        this.correoElectronico = correoElectronico;
        this.contrasena = contrasena;
        this.fechaNacimiento = fechaNacimiento;
        this.rol = rol;
        this.tipoDocumento = tipoDocumento;
        this.numDocumento = numDocumento;
        this.apartamentos = apartamentos;
    }

    // Getters y Setters

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getPrimerNombre() {
        return primerNombre;
    }

    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }

    public String getSegundoNombre() {
        return segundoNombre;
    }

    public void setSegundoNombre(String segundoNombre) {
        this.segundoNombre = segundoNombre;
    }

    public String getPrimerApellido() {
        return primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    public String getSegundoApellido() {
        return segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    public String getNumeroCelular() {
        return numeroCelular;
    }

    public void setNumeroCelular(String numeroCelular) {
        this.numeroCelular = numeroCelular;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public Date getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public int getNumDocumento() {
        return numDocumento;
    }

    public void setNumDocumento(int numDocumento) {
        this.numDocumento = numDocumento;
    }

    public Apartamento getApartamento() {
        return apartamentos;
    }

    public void setApartamentos(Apartamento apartamentos) {
        this.apartamentos = apartamentos;
    }

    // Métodos de conveniencia
    public String getTorre() {
        return apartamentos != null ? apartamentos.getTorre() : null;
    }

    public String getNumeroApartamento() {
        return apartamentos != null ? apartamentos.getApto() : null;
    }
}