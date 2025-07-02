package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Residente;
import logica.Usuario;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-07-01T22:45:38")
@StaticMetamodel(QuejaResidente.class)
public class QuejaResidente_ { 

    public static volatile SingularAttribute<QuejaResidente, Integer> idQueja;
    public static volatile SingularAttribute<QuejaResidente, Usuario> administrador;
    public static volatile SingularAttribute<QuejaResidente, String> motivoQueja;
    public static volatile SingularAttribute<QuejaResidente, String> estadoQueja;
    public static volatile SingularAttribute<QuejaResidente, Date> fechaQueja;
    public static volatile SingularAttribute<QuejaResidente, Residente> residente;

}