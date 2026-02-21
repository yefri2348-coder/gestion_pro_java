package controlador;

import modelo.Usuario;
import modelo.UsuarioDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("correo");
        String pass = request.getParameter("password");

        Usuario user = new Usuario(email, pass);
        UsuarioDAO dao = new UsuarioDAO();

        Usuario usuarioValidado = dao.validar(user);

        if (usuarioValidado != null) {

            // 🔐 Crear sesión
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuarioValidado);
            session.setAttribute("nombre", usuarioValidado.getNombre());

            // Redirigir al dashboard
            response.sendRedirect("dashboard.jsp");

        } else {
            response.sendRedirect("index.jsp?error=1");
        }
    }
}
