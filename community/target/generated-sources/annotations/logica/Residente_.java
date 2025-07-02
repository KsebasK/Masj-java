package logica;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Apartamento;
import logica.Usuario;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-07-01T21:52:54")
@StaticMetamodel(Residente.class)
public class Residente_ { 

    public static volatile SingularAttribute<Residente, Apartamento> apartamento;
    public static volatile SingularAttribute<Residente, Integer> idResidente;
    public static volatile SingularAttribute<Residente, Usuario> usuario;

}