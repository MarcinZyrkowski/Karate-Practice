package org.example.RuntimeHook;

import com.intuit.karate.RuntimeHook;
import com.intuit.karate.core.ScenarioRuntime;
import org.example.advanced_test_manager.AdvancedTestManager;

public class CustomRuntimeHook implements RuntimeHook {

  @Override
  public boolean beforeScenario(ScenarioRuntime sr) {
    AdvancedTestManager.init(sr);
    return RuntimeHook.super.beforeScenario(sr);
  }

}
