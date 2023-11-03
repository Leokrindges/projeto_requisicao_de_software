/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import apoio.ConexaoBD;
import entidade.Projeto;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public class ProjetoDAO {

    public boolean salvar(Projeto p) {

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "insert into projeto values ("
                    + "default,"
                    + "'" + p.getNomeProjeto() + "',"
                    + "'" + p.getDescricaoRequisito() + "',"
                    + "'" + p.getPrioridade() + "',"
                    + "'" + p.getComplexidade() + "',"
                    + "'" + p.getVersao() + "'"
                    + ")";

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return true;

        } catch (Exception e) {
            System.out.println("Erro ao salvar Projeto: " + e);
            return false;
        }
    }

    public ArrayList consultar() {
        ArrayList<Projeto> projetos = new ArrayList<>();

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "select * from projeto";

            System.out.println("SQL: " + sql);

            ResultSet resultado = st.executeQuery(sql);

            while (resultado.next()) {
                Projeto p = new Projeto();

                p.setCodigo(resultado.getInt("id"));
                p.setNomeProjeto(resultado.getString("nomeProjeto"));
                p.setDescricaoRequisito(resultado.getString("descricaoRequisito"));
                p.setPrioridade(resultado.getString("prioridade"));
                p.setComplexidade(resultado.getString("complexidade"));
                p.setVersao(resultado.getInt("versao"));
                projetos.add(p);
            }

        } catch (Exception e) {
            System.out.println("Erro ao consular projeto: " + e);
        }

        return projetos;
    }

    public Projeto consultar(int codigo) {
        Projeto projeto = new Projeto();

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "select * from projeto "
                    + "where "
                    + "id = " + codigo;

            System.out.println("SQL: " + sql);

            ResultSet resultado = st.executeQuery(sql);

            resultado.next();

            projeto.setCodigo(resultado.getInt("id"));
            projeto.setNomeProjeto(resultado.getString("nomeProjeto"));
            projeto.setDescricaoRequisito(resultado.getString("descricaoRequisito"));
            projeto.setPrioridade(resultado.getString("prioridade"));
            projeto.setComplexidade(resultado.getString("complexidade"));
            projeto.setVersao(resultado.getInt("versao"));

        } catch (Exception e) {
            System.out.println("Erro ao consular UM projeto: " + e);
        }

        return projeto;
    }

    public boolean excluir(int codigo) {

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "delete from projeto "
                    + "where "
                    + "id = " + codigo;

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return true;

        } catch (Exception e) {
            System.out.println("Erro ao excluir projeto: " + e);
            return false;
        }
    }

    public boolean atualizar(Projeto p) {

        try {
            Statement st = ConexaoBD.getInstance().getConnection().createStatement();

            String sql = ""
                    + "update projeto "
                    + "set "
                    + "nomeprojeto = '" + p.getNomeProjeto() + "', "
                    + "descricaorequisito = '" + p.getDescricaoRequisito() + "', "
                    + "prioridade = '" + p.getPrioridade() + "', "
                    + "complexidade = '" + p.getComplexidade() + "', "
                    + "versao = '" + p.getVersao() + "' "
                    + "where id = " + p.getCodigo();

            System.out.println("SQL: " + sql);

            st.executeUpdate(sql);

            return true;

        } catch (Exception e) {
            System.out.println("Erro ao atualizar projeto: " + e);
            return false;
        }
    }
}
