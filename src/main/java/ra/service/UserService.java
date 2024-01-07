package ra.service;

import ra.dto.request.LoginRequest;
import ra.dto.response.LoginResponse;
import ra.dto.response.UserResponse;
import ra.model.User;

import java.util.List;

public interface UserService {
    LoginResponse login(LoginRequest loginRequest);
    List<UserResponse> findAll();
    int countUsersByStatusIsTrue();
    int countUsersByStatusIsFalse();
}
