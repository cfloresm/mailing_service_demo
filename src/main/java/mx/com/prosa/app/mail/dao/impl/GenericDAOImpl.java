package mx.com.prosa.app.mail.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;

import mx.com.prosa.app.mail.dao.GenericDAO;

/**
 * Implementation CRUD for Generic DAO .
 * @author carlos
 *
 * @param <T>
 */
public abstract class GenericDAOImpl<T> implements GenericDAO<T> {

    @PersistenceContext
    protected EntityManager entityManager;
    
    private Class<T> type;

    public GenericDAOImpl() {
        Type t = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) t;
        this.type = (Class) pt.getActualTypeArguments()[0];
    }
    
    @Override
    public T create(final T t) {
        this.entityManager.persist(t);
        return t;
    }

    @Override
    public void delete(final Object id) {
        this.entityManager.remove(this.entityManager.getReference(type, id));
    }

    @Override
    public T find(final Object id) {
        return (T) this.entityManager.find(type, id);
    }

    @Override
    public T update(final T t) {
        this.entityManager.merge(t);
        return t;
    }
    
}
