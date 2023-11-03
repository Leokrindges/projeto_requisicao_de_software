/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet;

import dao.ProjetoDAO;
import dao.UsuarioDAO;
import entidade.Projeto;
import entidade.Usuario;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author Usuario
 */
public class acao extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet acao</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet acao at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String a = request.getParameter("a");

        if (a.equals("editarProjeto")) {
            String id = request.getParameter("id");
            int codigo = Integer.parseInt(id);

            Projeto projeto = new ProjetoDAO().consultar(codigo);

            request.setAttribute("projeto_cadastro", projeto);

            encaminharPagina("edicaoRequisitos.jsp", request, response);
        }

        if (a.equals("excluirProjeto")) {
            String id = request.getParameter("id");
            int codigo = Integer.parseInt(id);

            if (new ProjetoDAO().excluir(codigo)) {
                request.setAttribute("mensagemExcluirSucesso", "Excluido com sucesso!!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("editar.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("mensagemExcluirErro", "Erro ao excluir!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("editar.jsp");
                dispatcher.forward(request, response);
            }
        }

        if (a.equals("editarUsuario")) {
            String id = request.getParameter("id");
            int codigo = Integer.parseInt(id);

            Usuario usuario = new UsuarioDAO().consultar(codigo);

            request.setAttribute("usuario_cadastro", usuario);

            encaminharPagina("editarUsuarios.jsp", request, response);
        }

        if (a.equals("excluirUsuario")) {
            String id = request.getParameter("id");
            int codigo = Integer.parseInt(id);

            if (new UsuarioDAO().excluir(codigo)) {
                request.setAttribute("mensagemExcluirSucesso", "Excluido com sucesso!!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("listarUsuario.jsp");
                dispatcher.forward(request, response);
            } else {
                request.setAttribute("mensagemExcluirErro", "Erro ao excluir!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("listarUsuario.jsp");
                dispatcher.forward(request, response);
            }
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String a = request.getParameter("a");

        if (a.equals("salvarProjeto")) {
            int codigo = 0;
            String nomeProjeto = request.getParameter("nomeprojeto");;
            String descricaoRequisito = request.getParameter("descrequisito");
            String prioridade = request.getParameter("prioridade");
            String complexidade = request.getParameter("complexidade");
            String versao = request.getParameter("versao");

            Projeto projeto = new Projeto();
            int id = (codigo);
            int versoes = Integer.parseInt(versao);
            projeto.setCodigo(id);
            projeto.setNomeProjeto(nomeProjeto);
            projeto.setDescricaoRequisito(descricaoRequisito);
            projeto.setPrioridade(prioridade);
            projeto.setComplexidade(complexidade);
            projeto.setVersao(versoes);

            if (id == 0) {
                if (new ProjetoDAO().salvar(projeto)) {
                    request.setAttribute("mensagemSucessoCadastro", "Cadastrado com sucesso!!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("cadastro.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("mensagemErroCadastro", "Falha ao cadastrar");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("cadastro.jsp");
                    dispatcher.forward(request, response);
                }
            }
        }

        if (a.equals("edicaoProjeto")) {
            String codigo = request.getParameter("codigo");;
            String nomeProjeto = request.getParameter("nomeprojeto");;
            String descricaoRequisito = request.getParameter("descrequisito");
            String prioridade = request.getParameter("prioridade");
            String complexidade = request.getParameter("complexidade");
            String versao = request.getParameter("versao");

            Projeto projeto = new Projeto();
            int id = Integer.parseInt(codigo);
            int versoes = Integer.parseInt(versao);
            projeto.setCodigo(id);
            projeto.setNomeProjeto(nomeProjeto);
            projeto.setDescricaoRequisito(descricaoRequisito);
            projeto.setPrioridade(prioridade);
            projeto.setComplexidade(complexidade);
            projeto.setVersao(versoes);

            if (new ProjetoDAO().atualizar(projeto)) {
                request.setAttribute("mensagemSucessoCadastro", "Cadastrado com sucesso!!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("editar.jsp");
                dispatcher.forward(request, response);
                encaminharPagina("sucesso.jsp", request, response);
            } else {
                request.setAttribute("mensagemErroCadastro", "Falha ao cadastrar");
                RequestDispatcher dispatcher = request.getRequestDispatcher("editar.jsp");
                dispatcher.forward(request, response);
            }
        }

        if (a.equals("criarConta")) {
            int codigo = 0;
            String email = request.getParameter("criarEmail");;
            String senha = request.getParameter("criarSenha");
            String tipoUsuario = request.getParameter("tipoUsuario");

            Usuario usuario = new Usuario();
            int id = (codigo);
            usuario.setId(id);
            usuario.setUsuario(email);
            usuario.setSenha(senha);
            usuario.setTipoUsuario(tipoUsuario);

            if (id == 0) {
                if (new UsuarioDAO().salvar(usuario)) {
                    request.setAttribute("mensagemSucessoCadastro", "Cadastrado com sucesso!!");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("criar_conta.jsp");
                    dispatcher.forward(request, response);
                } else {
                    request.setAttribute("mensagemErroCadastro", "Falha ao cadastrar");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("criar_conta.jsp");
                    dispatcher.forward(request, response);
                }
            }
        }
        
        
        if (a.equals("edicaoUsuario")) {
            String codigo = request.getParameter("idUsuario");;
            String usuarios = request.getParameter("criarEmail");;
            String senha = request.getParameter("criarSenha");
            String tipoUsuario = request.getParameter("tipoUsuario");
            
            Usuario usuario = new Usuario();
            int id = Integer.parseInt(codigo);
            usuario.setId(id);
            usuario.setUsuario(usuarios);
            usuario.setSenha(senha);
            usuario.setTipoUsuario(tipoUsuario);
            

            if (new UsuarioDAO().atualizar(usuario)) {
                request.setAttribute("mensagemSucessoCadastro", "Cadastrado com sucesso!!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("listarUsuario.jsp");
                dispatcher.forward(request, response);
                encaminharPagina("sucesso.jsp", request, response);
            } else {
                request.setAttribute("mensagemErroCadastro", "Falha ao cadastrar");
                RequestDispatcher dispatcher = request.getRequestDispatcher("listarUsuario.jsp");
                dispatcher.forward(request, response);
            }
        }
        

        if (a.equals("login")) {
            // logica do login
            // pegar usuario
            // pegar senha
            // autenticar = verificar
            // sucesso = vai pro sistema || erro = login de novo

            String user = request.getParameter("user");
            String password = request.getParameter("password");

            System.out.println("User: " + user);
            System.out.println("Password: " + password);

            Usuario usuario = new UsuarioDAO().autenticar(user, password);

            if (usuario != null) {
                HttpSession sessao = request.getSession();
                sessao.setAttribute("user", usuario);

                encaminharPagina("cadastro.jsp", request, response);
            } else {
                request.setAttribute("mensagem", "Por favor, verifique seu usuario e senha!!");
                RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                dispatcher.forward(request, response);
            }
        }

        if (a.equals("logout")) {
            HttpSession sessao = request.getSession();
            sessao.invalidate();

            response.sendRedirect("login.jsp");
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void encaminharPagina(String pagina, HttpServletRequest request, HttpServletResponse response) {
        try {
            RequestDispatcher rd = request.getRequestDispatcher(pagina);
            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println("Erro ao encaminhar: " + e);
        }
    }

}
