public Vector<JsonJTableExpenseBean> obtenerUsuarios(String entidad, String order){
Connection cnn = null;
CallableStatement cs = null;
ResultSet rs = null;
ConexionBD con = new ConexionBD();
Vector<JsonJTableExpenseBean> listaResult = new
Vector<JsonJTableExpenseBean>();
try{
    cnn=con.abrirConexionAtencion();
    cs=cnn.prepareCall("{call PKG_USUARIOS.GET_USUARIO(?,?,?)}");
    cs.setString(1,entidad);
    cs.setString(2, order);
    cs.registerOutParameter(3, OracleTypes.CURSOR);
    cs.executeQuery();
    rs=(ResultSet)cs.getObject(3);
        while(rs.next()){
        JsonJTableExpenseBean users = new JsonJTableExpenseBean();
                    users.setId(rs.getInt("ID"));
                    users.setNombre(rs.getString("LOGIN"));
                    users.setNombre(rs.getString("PASSWORD"));
                    users.setPerfil(rs.getString("ROLID"));
                    listaResult.add(users);
        }
} catch (NamingException e) {
        logger.info("Error NamingException en el metodo obtenerUsuarios " +
        e.getMessage());
        e.printStackTrace();
} catch (SQLException e) {
        logger.info("Error SQLException metodo obtenerUsuarios " +
        e.getMessage());
        e.printStackTrace();
}catch(Exception ex){
        logger.info("Error en el metodo obtenerUsuarios " + ex.getMessage());
} finally {
        super.cerrarCallable(cs);
        super.cerrarResultSet(rs);
        super.cerrarConexion(cnn);
} return listaResult;
}
    public JsonJTableExpenseBean setUsuarios(String login, String password, String rolId)
{
            Connection cnn = null;
            CallableStatement cs = null;
            ResultSet rs = null;
            JsonJTableExpenseBean usuarios = new JsonJTableExpenseBean();
            ConexionBD con = new ConexionBD();
try{
        cnn=con.abrirConexionAtencion();
        cs=cnn.prepareCall("{call PKG_USUARIOS.SET_USUARIO(?,?,?,?,?) }");
        cs.setInt(1, login);
        cs.setString(2, password);
        cs.setString(3, rolId);
        cs.registerOutParameter(4, OracleTypes.NUMERIC);
        cs.registerOutParameter(5, OracleTypes.VARCHAR);
        cs.executeQuery();
        usuarios.setCodigoRespuesta(cs.getString(4));
        usuarios.setMensajeRespuesta(cs.getString(5));
} catch (NamingException e) {
        logger.info("Error NamingException en el metodo setUsuarios " +
        e.getMessage());
        e.printStackTrace();
} catch (SQLException e) {
    logger.info("Error SQLException en el metodo setUsuarios " +
    e.getMessage());
    e.printStackTrace();
}catch(Exception ex){
        logger.info("Error en el metodo setUsuarios " + ex.getMessage());
}finally {
            super.cerrarCallable(cs);
            super.cerrarResultSet(rs);
            super.cerrarConexion(cnn);
} return usuarios;
} p
ublic JsonJTableExpenseBean updUsuarios(Integer id, String login, String password,
Integer rolId) {
        Connection cnn = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        JsonJTableExpenseBean usuarios = new JsonJTableExpenseBean();
        ConexionBD con = new ConexionBD();
            try {
                    cnn=con.abrirConexionAtencion();
                    cs=cnn.prepareCall("{call
                    PKG_USUARIOS.UPD_USUARIO(?,?,?,?,?,?) }");
                    cs.setInt(1, id);
                    cs.setString(2, login);
                    cs.setString(3, password);
                    cs.setInt(4, rolId);
                    cs.registerOutParameter(5, OracleTypes.NUMERIC);
                    cs.registerOutParameter(6, OracleTypes.VARCHAR);
                    cs.executeQuery();
                    usuarios.setCodigoRespuesta(cs.getString(5));
                    usuarios.setMensajeRespuesta(cs.getString(6));
            } catch (NamingException e){
                logger.info("Error NamingException en el metodo updUsuarios " +
                e.getMessage());
                e.printStackTrace();
        } catch (SQLException e){
            logger.info("Error SQLException en el metodo updUsuarios " +
            e.getMessage());
            e.printStackTrace();
        }catch(Exception ex){
             logger.info("Error en el metodo updUsuarios " + ex.getMessage());
        }finally {
                super.cerrarCallable(cs);
                super.cerrarResultSet(rs);
                super.cerrarConexion(cnn);
        } return usuarios;
}p
        ublic JsonJTableExpenseBean delUsuarios(Integer id){
        Connection cnn = null;
        CallableStatement cs = null;
        ResultSet rs = null;
        JsonJTableExpenseBean usuarios = new JsonJTableExpenseBean();
        ConexionBD con = new ConexionBD();
try {
        cnn=con.abrirConexionAtencion();
        cs=cnn.prepareCall("{call PKG_USUARIOS.DEL_USUARIO(?,?,?) }");
        cs.setInt(1, id);
        cs.registerOutParameter(2, OracleTypes.NUMERIC);
        cs.registerOutParameter(3, OracleTypes.VARCHAR);
        cs.executeQuery();
        usuarios.setCodigoRespuesta(cs.getString(2));
        usuarios.setMensajeRespuesta(cs.getString(3));
} catch (NamingException e) {
            logger.info("Error NamingException en el metodo delUsuarios " +
            e.getMessage());
            e.printStackTrace();
} catch (SQLException e) {
        logger.info("Error SQLException en el metodo delUsuarios " +
        e.getMessage());
        e.printStackTrace();
}catch(Exception ex){
        logger.info("Error en el metodo delUsuarios " + ex.getMessage());
}finally {
                super.cerrarCallable(cs);
                super.cerrarResultSet(rs);
                super.cerrarConexion(cnn);
} 
return usuarios;
}