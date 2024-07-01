package com.chainsys.trainingacademy.dao;

import org.springframework.stereotype.Repository;

import com.chainsys.trainingacademy.model.Users;

@Repository
public interface UserDAO {

boolean insertRegister( Users insertDetails);
boolean insertLogin(Users insertLoginDetails);
Users getId(Users insertLoginDetails);


}
