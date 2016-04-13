package com.zhou.model;

import javax.persistence.*;


@Entity
@Table(name = "role", schema = "springdemo", catalog = "")
public class RoleEntity {
    private int id;
    private String auth;
    private UserEntity userInRoleByUserId;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "auth", nullable = false, length = 45)
    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        RoleEntity that = (RoleEntity) o;

        if (id != that.id) return false;
        if (auth != null ? !auth.equals(that.auth) : that.auth != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (auth != null ? auth.hashCode() : 0);
        return result;
    }

    @OneToOne
    @JoinColumn(name = "role_user_id", referencedColumnName = "id")
    public UserEntity getUserInRoleByUserId() {
        return userInRoleByUserId;
    }

    public void setUserInRoleByUserId(UserEntity userInRoleByUserId) {
        this.userInRoleByUserId = userInRoleByUserId;
    }
}
