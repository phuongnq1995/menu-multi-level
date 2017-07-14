package org.phuongnq.demo.repository;

import java.util.List;

import org.phuongnq.demo.model.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CategoryJpaRepository extends JpaRepository<CategoryEntity, Long>{
	
	@Query(value="select c from CategoryEntity c where parent IS NULL")
	public List<CategoryEntity> findListOriginal();

	@Query(value="SELECT * FROM category where parent_id = ?1", nativeQuery=true)
	public List<CategoryEntity> getChildren(long id);
}
