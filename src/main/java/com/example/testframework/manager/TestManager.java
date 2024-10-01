package com.example.testframework.manager;

import com.example.testframework.assertion.SingleUserResponseAssertion;
import com.example.testframework.controller.ReqResController;
import com.example.testframework.factory.SingleUserResponseFactory;
import com.example.testframework.factory.UserFactory;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
@Getter
public class TestManager {

  public static TestManager getInstance() {
    return new TestManager();
  }

  private final ReqResController reqResController = new ReqResController();
  private final UserFactory userFactory = new UserFactory();
  private final SingleUserResponseAssertion singleUserResponseAssertion = new SingleUserResponseAssertion();
  private final SingleUserResponseFactory singleUserResponseFactory = new SingleUserResponseFactory();

}
