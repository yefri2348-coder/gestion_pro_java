package controlador;

import modelo.Usuario;
import modelo.UsuarioDAO;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class UsuarioServlet extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null) {
            accion = "listar";
        }

        switch (accion) {

            case "listar":
                List<Usuario> lista = dao.listar();
                request.setAttribute("usuarios", lista);
                request.getRequestDispatcher("usuarios.jsp")
                        .forward(request, response);
                break;

            case "eliminar":
                int idEliminar = Integer.parseInt(request.getParameter("id"));
                dao.eliminar(idEliminar);
                response.sendRedirect("UsuarioServlet?accion=listar");
                break;

            case "editar":
                int idEditar = Integer.parseInt(request.getParameter("id"));
                Usuario usuario = dao.buscarPorId(idEditar);
                request.setAttribute("usuario", usuario);
                request.getRequestDispatcher("editarUsuario.jsp")
                        .forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("actualizar".equals(accion)) {

            Usuario u = new Usuario();
            u.setId(Integer.parseInt(request.getParameter("id")));
            u.setNombre(request.getParameter("nombre"));
            u.setCorreo(request.getParameter("correo"));
            u.setPassword(request.getParameter("password"));

            dao.actualizar(u);

            response.sendRedirect("UsuarioServlet?accion=listar");
        }
    }
}
