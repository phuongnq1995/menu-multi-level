package org.phuongnq.demo.repository;

import java.util.List;

import org.phuongnq.demo.model.SaleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SaleJpaRepository extends JpaRepository<SaleEntity, Integer>{
	
	public List<SaleEntity> findByCategoryId(int id);
}
