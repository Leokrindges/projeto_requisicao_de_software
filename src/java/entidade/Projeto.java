/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidade;

/**
 *
 * @author Usuario
 */
public class Projeto {

    private int codigo;
    private String nomeProjeto;
    private String descricaoRequisito;
    private String prioridade;
    private String complexidade;
    private int versao;

    public Projeto() {
        nomeProjeto = "";
        descricaoRequisito = "";
        prioridade = "";
        complexidade = "";

    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNomeProjeto() {
        return nomeProjeto;
    }

    public void setNomeProjeto(String nomeProjeto) {
        this.nomeProjeto = nomeProjeto;
    }

    public String getDescricaoRequisito() {
        return descricaoRequisito;
    }

    public void setDescricaoRequisito(String descricaoRequisito) {
        this.descricaoRequisito = descricaoRequisito;
    }

    public String getPrioridade() {
        return prioridade;
    }

    public void setPrioridade(String prioridade) {
        this.prioridade = prioridade;
    }

    public String getComplexidade() {
        return complexidade;
    }

    public void setComplexidade(String Complexidade) {
        this.complexidade = Complexidade;
    }

    public int getVersao() {
        return versao;
    }

    public void setVersao(int versao) {
        this.versao = versao;
    }

}
