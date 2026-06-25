package com.jsp.ojpms.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.ojpms.entity.Job;
import com.jsp.ojpms.entity.User;
import com.jsp.ojpms.util.JPAUtil;

public class JobDao {

	public static void saveJob(Job job) {
		EntityManager em = JPAUtil.getEm();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(job);
		et.commit();
	}

	public static List<Job> getAllJobs() {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Job");
		List<Job> list = query.getResultList();
		return list;
	}

	public static List<Job> getSearchedJob(String search) {
		EntityManager em = JPAUtil.getEm();
		Query query = em.createQuery("FROM Job WHERE title LIKE ?1 OR description LIKE ?1 OR location LIKE ?1");
		query.setParameter(1, "%" + search + "%");
		List list = query.getResultList();

		return list;
	}

	public static List<Job> getJobsByRecruiter(int recruiterId) {
		EntityManager em = JPAUtil.getEm();

		Query query = em.createQuery("FROM Job WHERE recuriter.id = ?1");

		query.setParameter(1, recruiterId);

		return query.getResultList();
	}

	public static Job getJobById(int id) {
		EntityManager em = JPAUtil.getEm();

		return em.find(Job.class, id);
	}

	public static void updateJob(Job job) {
		EntityManager em = JPAUtil.getEm();

		EntityTransaction et = em.getTransaction();

		et.begin();
		em.merge(job);
		et.commit();
	}

	public static int getJobCountByRecruiter(int recruiterId) {
		EntityManager em = JPAUtil.getEm();

		Query query = em.createQuery("SELECT COUNT(j) FROM Job j WHERE recuriter.id=?1");

		query.setParameter(1, recruiterId);

		Long count = (Long) query.getSingleResult();

		return count.intValue();
	}
	
	public static void removeJob(Job job)
	{
		EntityManager em = JPAUtil.getEm();

		EntityTransaction et = em.getTransaction();
		
		Job job2 = em.find(Job.class, job.getId());
		
		et.begin();
		
		em.remove(job2);
		
		et.commit();
		
	}
	
	
}
