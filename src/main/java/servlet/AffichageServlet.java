package servlet;

import entity.Chien;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import repository.ChienRepository;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/affichage")
public class AffichageServlet extends HttpServlet {
    private ChienRepository chienRepository ;
    private List<Chien> chiensList;
    private String titre;

    public void init() {
        chienRepository = new ChienRepository();
        chiensList = chienRepository.findAll();
        this.titre = "🐶affichage de la liste des chien 🐶";
    }


    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("titre", titre);
        req.setAttribute("chiens", chiensList);
        getServletContext().getRequestDispatcher("/WEB-INF/affichage.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Chien chien = Chien.builder()
                .nomChien(req.getParameter("nom"))
                .race(req.getParameter("race"))
                .dateNaissance(LocalDate.parse(req.getParameter("dateDeNaissance")))
                .build();
        chienRepository.createOrUpdate(chien);
//        chiensList = chienRepository.findAll();
        chiensList.add(chien);
        doGet(req, resp);
    }

}
