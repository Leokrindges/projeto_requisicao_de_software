/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import apoio.ConexaoBD;
import entidade.Usuario;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class UsuarioDAO {

    public Usuario consultar(int codigo) {
        Usuario usuario = new Usuario();

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "select * from usuario "
                    + "where "
                    + "id = " + codigo;

            System.out.println("SQL: " + sql);

            ResultSet resultado = st.executeQuery(sql);

            resultado.next();

            usuario.setId(resultado.getInt("id"));
            usuario.setUsuario(resultado.getString("criarEmail"));
            usuario.setSenha(resultado.getString("criarSenha"));

        } catch (Exception e) {
            System.out.println("Erro ao consular um Usuario: " + e);
        }

        return usuario;
    }

    public ArrayList consultar() {
        ArrayList<Usuario> usuarios = new ArrayList<>();

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "select * from usuario";

            System.out.println("SQL: " + sql);

            ResultSet resultado = st.executeQuery(sql);

            while (resultado.next()) {
                Usuario u = new Usuario();

                u.setId(resultado.getInt("id"));
                u.setUsuario(resultado.getString("usuario"));
                u.setSenha(resultado.getString("senha"));
                u.setTipoUsuario(resultado.getString("tipousuario"));

                usuarios.add(u);
            }

        } catch (Exception e) {
            System.out.println("Erro ao consular Usuario: " + e);
        }

        return usuarios;
    }

    public boolean salvar(Usuario u) {

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "insert into usuario values ("
                    + "default,"
                    + "'" + u.getUsuario() + "',"
                    + "'" + u.getSenha() + "',"
                    + "'" + u.getTipoUsuario() + "'"
                    + ")";

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return true;

        } catch (Exception e) {
            System.out.println("Erro ao salvar Usuario: " + e);
            return false;
        }
    }

    public Usuario autenticar(String usuario, String senha) {

        Usuario u = null;

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = "SELECT * FROM usuario WHERE usuario = '" + usuario + "' AND senha = '" + senha + "'";

            System.out.println("SQL: " + sql);

            ResultSet resultado = st.executeQuery(sql);

            if (resultado.next()) {
                // Autenticação bem-sucedida
                u = new Usuario();
                u.setUsuario(resultado.getString("usuario"));
                u.setSenha(resultado.getString("senha"));
                System.out.println("Autenticação bem-sucedida.");

            } else {
                // Autenticação falhou
                System.out.println("Autenticação falhou.");
            }

            st.executeUpdate(sql);

        } catch (Exception e) {
            System.out.println("Erro ao salvar Usuario: " + e);

        }
        return u;
    }

    public boolean excluir(int codigo) {

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "delete from usuario "
                    + "where "
                    + "id = " + codigo;

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return true;

        } catch (Exception e) {
            System.out.println("Erro ao excluir Usuario: " + e);
            return false;
        }
    }
    
    public boolean atualizar(Usuario u) {

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "update usuario "
                    + "set "
                    + "usuario = '" + u.getUsuario() + "', "
                    + "senha = '" + u.getSenha() + "', "
                    + "tipousuario = '" + u.getTipoUsuario() + "' "                  
                    + "where id = " + u.getId();

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return true;

        } catch (Exception e) {
            System.out.println("Erro ao atualizar Usuario: " + e);
            return false;
        }
    }
}
