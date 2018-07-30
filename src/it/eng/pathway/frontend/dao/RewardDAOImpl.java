/**
 * 
 */
package it.eng.pathway.frontend.dao;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import it.eng.pathway.frontend.model.Reward;

/**
 * @author fabiomelillo
 *
 */
@Service
public class RewardDAOImpl extends GenericDAO<Reward> implements RewardDAO {

	@Autowired
	private EntityManager em;
	
	

}