package com.jsp.ojpms.util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JPAUtil {

    private static final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("jsp");

    private JPAUtil() {

    }

    public static EntityManager getEm() {

        return emf.createEntityManager();
    }
}