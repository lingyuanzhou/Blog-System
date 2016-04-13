package com.zhou.repository;

import com.zhou.model.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface RoleRepository extends JpaRepository<RoleEntity, Integer> {
    @Modifying
    @Transactional

    @Query("update RoleEntity role set role.auth=:qAuth where role.userInRoleByUserId.id=:qId")
    public void updateRole(@Param("qAuth") String auth, @Param("qId") Integer id);
}
