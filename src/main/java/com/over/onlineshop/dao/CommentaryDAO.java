package com.over.onlineshop.dao;

import com.over.onlineshop.entities.Commentary;

public interface CommentaryDAO {

    void addCommentary(Commentary commentary, Long productId, String username);

    void removeCommentary(Long id);

    void editCommentary(Long id);

    Commentary getCommentary(Long id);
}
