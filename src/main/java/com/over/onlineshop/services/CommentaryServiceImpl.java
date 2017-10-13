package com.over.onlineshop.services;

import com.over.onlineshop.dao.CommentaryDAO;
import com.over.onlineshop.entities.Commentary;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CommentaryServiceImpl implements CommentaryService {

    private CommentaryDAO commentaryDAO;

    @Override
    @Transactional
    public void addCommentary(Commentary commentary, Long productId, String username) {
        commentaryDAO.addCommentary(commentary, productId, username);
    }

    @Override
    @Transactional
    public void removeCommentary(Long id) {
        commentaryDAO.removeCommentary(id);
    }

    @Override
    @Transactional
    public void editCommentary(Long id) {

    }

    @Override
    @Transactional
    public Commentary getCommentary(Long id) {
        return commentaryDAO.getCommentary(id);
    }

    public void setCommentaryDAO(CommentaryDAO commentaryDAO) {
        this.commentaryDAO = commentaryDAO;
    }
}
