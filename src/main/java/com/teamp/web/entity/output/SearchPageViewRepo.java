package com.teamp.web.entity.output;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface SearchPageViewRepo extends JpaRepository<SearchPageView, Integer>, JpaSpecificationExecutor<SearchPageView>{


	List<SearchPageView> findByModelnameLike(String kwd);

	List<SearchPageView> findByModelnameContaining(String kwd);

	long countByModelnameContaining(String kwd);    

	List<SearchPageView> findTop5ByOrderByViewsDesc();

	List<brandname> findDistinctSearchPageViewBy();

	long countDistinctBy();

	@Query(value = "Select distinct "+ " transmission_type " + " from vehicle_information " , nativeQuery = true)
	List<String> findDistinctTransmissiontype();
	
	@Query(value = "Select distinct "+ " manufacturer " + " from vehicle_information " , nativeQuery = true)
	List<String> findDistinctManufacturer();
	
	@Query(value = "Select distinct "+ " fuel_type " + " from vehicle_information ", nativeQuery = true)
	List<String> findDistinctFueltype();
	
	@Query(value = "Select distinct "+ " vehicle_type " + " from vehicle_information ", nativeQuery = true)
	List<String> findDistinctVehicletype();
	
	@Query(value = "Select distinct "+ " passenger_capacity " + " from vehicle_information ", nativeQuery = true)
	List<String> findDistinctPassengercapacity();
	
	@Query(value = "Select distinct "+ " domestic_import " + " from vehicle_information ", nativeQuery = true)
	List<String> findDistinctDomesticimport();
	
	@Query(value = "Select distinct "+ " wheel_type " + " from vehicle_information ", nativeQuery = true)
	List<String> findDistinctWheeltype();

		

}
