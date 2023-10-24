package com.teamp.web.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.teamp.web.entity.VehicleInformationEntity;
import com.teamp.web.entity.input.Board;

@Repository
public interface BoardRepository extends JpaRepository<Board, Integer> , JpaSpecificationExecutor<Board> {

    List<Board> findByNickname(String nickname);

    List<Board> findByVehicleInformation(VehicleInformationEntity vehicleInformation);

    List<Board> findByRegistrationDateBetween(Date start, Date end);

    List<Board> findByViewsGreaterThanOrderByRegistrationDateDesc(int views);

    Board findBoardByBno(int bno);
    
    @Modifying
    @Query("UPDATE Board SET views = views + 1 WHERE bno = :bno")
    void increaseViews(@Param("bno") int bno);


}
