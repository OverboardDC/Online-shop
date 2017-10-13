package com.over.onlineshop.services;

import com.over.onlineshop.entities.Commentary;

public interface CommentaryService {

    void addCommentary(Commentary commentary, Long productId, String username);

    void removeCommentary(Long id);

    void editCommentary(Long id);

    Commentary getCommentary(Long id);
}
