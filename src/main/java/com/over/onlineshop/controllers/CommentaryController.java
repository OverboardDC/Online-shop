package com.over.onlineshop.controllers;

import com.over.onlineshop.entities.Commentary;
import com.over.onlineshop.services.CommentaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CommentaryController {

    @Autowired
    private CommentaryService commentaryService;

    @RequestMapping(value = "/addCommentary", method = RequestMethod.POST)
    public String addCommentary(@ModelAttribute("commentary") Commentary commentary,
                                @RequestParam("product_id") Long productId,
                                @RequestParam("username") String username
    ) {
        commentaryService.addCommentary(commentary, productId, username);
        return "redirect:/product/" + productId;
    }

    @RequestMapping(value = "/removeCommentary/{id}")
    public String removeCommentary(@PathVariable("id") Long id, HttpServletRequest request) {
        Commentary commentary = commentaryService.getCommentary(id);

            if (request.getUserPrincipal().getName().equals(commentary.getUser().getUsername())
                    || request.isUserInRole("ROLE_ADMIN")
                    ) {
                commentaryService.removeCommentary(id);
                return "redirect:/product/" + commentary.getProduct().getId();
        } else {
            return "errorPage";
        }
    }
}
