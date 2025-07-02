package logica;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2025-07-01T21:52:54")
@StaticMetamodel(QuejasAdmin.class)
public class QuejasAdmin_ { 

    public static volatile SingularAttribute<QuejasAdmin, Integer> idQueja;
    public static volatile SingularAttribute<QuejasAdmin, Integer> idAdministrador;
    public static volatile SingularAttribute<QuejasAdmin, String> motivoQueja;
    public static volatile SingularAttribute<QuejasAdmin, Integer> idResidente;
    public static volatile SingularAttribute<QuejasAdmin, String> estadoQueja;
    public static volatile SingularAttribute<QuejasAdmin, Date> fechaQueja;

}