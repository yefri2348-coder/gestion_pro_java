package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexion.Conexion;

public class UsuarioDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    // ==========================
    // VALIDAR LOGIN
    // ==========================
    public Usuario validar(Usuario user) {

        Usuario usuario = null;
        String sql = "SELECT * FROM usuario WHERE correo=? AND password=?";

        try {

            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getCorreo());
            ps.setString(2, user.getPassword());
            rs = ps.executeQuery();

            if (rs.next()) {

                usuario = new Usuario();
                usuario.setId(rs.getInt("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setCorreo(rs.getString("correo"));
                usuario.setPassword(rs.getString("password"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            cerrarConexion();
        }

        return usuario;
    }

    // ==========================
    // REGISTRAR USUARIO
    // ==========================
    public boolean registrar(Usuario user) {

        String sql = "INSERT INTO usuario (nombre, correo, password) VALUES (?, ?, ?)";

        try {

            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, user.getNombre());
            ps.setString(2, user.getCorreo());
            ps.setString(3, user.getPassword());

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            cerrarConexion();
        }

        return false;
    }

    // ==========================
    // LISTAR USUARIOS
    // ==========================
    public List<Usuario> listar() {

        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM usuario";

        try {

            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {

                Usuario u = new Usuario();
                u.setId(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setCorreo(rs.getString("correo"));
                lista.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            cerrarConexion();
        }

        return lista;
    }

    // ==========================
    // BUSCAR POR ID
    // ==========================
    public Usuario buscarPorId(int id) {

        Usuario u = null;
        String sql = "SELECT * FROM usuario WHERE id_usuario=?";

        try {

            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                u = new Usuario();
                u.setId(rs.getInt("id_usuario"));
                u.setNombre(rs.getString("nombre"));
                u.setCorreo(rs.getString("correo"));
                u.setPassword(rs.getString("password"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            cerrarConexion();
        }

        return u;
    }

    // ==========================
    // ACTUALIZAR USUARIO
    // ==========================
    public boolean actualizar(Usuario u) {

        String sql = "UPDATE usuario SET nombre=?, correo=?, password=? WHERE id_usuario=?";

        try {

            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getNombre());
            ps.setString(2, u.getCorreo());
            ps.setString(3, u.getPassword());
            ps.setInt(4, u.getId());

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            cerrarConexion();
        }

        return false;
    }

    // ==========================
    // ELIMINAR USUARIO
    // ==========================
    public boolean eliminar(int id) {

        String sql = "DELETE FROM usuario WHERE id_usuario=?";

        try {

            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            cerrarConexion();
        }

        return false;
    }

    // ==========================
    // VALIDAR SI CORREO EXISTE
    // ==========================
    public boolean existeCorreo(String correo) {

        String sql = "SELECT id_usuario FROM usuario WHERE correo=?";

        try {

            con = Conexion.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);
            rs = ps.executeQuery();

            if (rs.next()) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            cerrarConexion();
        }

        return false;
    }

    // ==========================
    // CERRAR CONEXIONES
    // ==========================
    private void cerrarConexion() {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


