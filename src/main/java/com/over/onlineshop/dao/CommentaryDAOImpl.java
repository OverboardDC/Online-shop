package com.over.onlineshop.dao;

import com.over.onlineshop.entities.Commentary;
import com.over.onlineshop.entities.Product;
import com.over.onlineshop.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Repository
public class CommentaryDAOImpl implements CommentaryDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private static final Logger logger = LoggerFactory.getLogger(CommentaryDAOImpl.class);

    @Override
    public void addCommentary(Commentary commentary, Long productId, String username) {
        User user = (User) getSession().createCriteria(User.class).add(Restrictions.eq("username", username)).uniqueResult();
        Product product = (Product) getSession().createCriteria(Product.class).add(Restrictions.eq("id", productId)).uniqueResult();
        commentary.setProduct(product);
        commentary.setUser(user);
        commentary.setDate(new Date());
        getSession().persist(commentary);
    }

    @Override
    public void removeCommentary(Long id) {
        Commentary commentary = getCommentary(id);
        getSession().delete(commentary);
        logger.info("Commentary with id: "+id+" was successfully removed");
    }

    @Override
    public void editCommentary(Long id) {

    }

    @Override
    public Commentary getCommentary(Long id) {
        return  (Commentary) getSession().createCriteria(Commentary.class).add(Restrictions.eq("id", id)).uniqueResult();
    }

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
