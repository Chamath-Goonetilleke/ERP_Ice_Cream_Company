package com.AdwinsCom.AdwinsCom.dao;
import com.AdwinsCom.AdwinsCom.entity.Ingredeint;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import java.util.List;

public interface IngredeintDao extends JpaRepository<Ingredeint,Integer> {

    //Define query for get item with selected column
    @Query(value = "select new Ingredeint (ing.id,ing.ingredeintcode,ing.ingredeintname) from Ingredeint ing where ing.ingredeintstatus_id.id = 1")
    List<Ingredeint> getAvailableItemList();

}
