package org.example.advanced_test_manager;

import com.intuit.karate.core.ScenarioRuntime;
import java.time.Instant;
import java.util.UUID;
import org.example.utils.JsonConverter;

public class AdvancedTestManager {

  private final ScenarioRuntime karateObject;

  public AdvancedTestManager(ScenarioRuntime karateObject) {
    this.karateObject = karateObject;
  }

  public static AdvancedTestManager init(ScenarioRuntime karateObject) {
    AdvancedTestManager advancedTestManager = new AdvancedTestManager(karateObject);
    karateObject.engine.setVariable("advancedTestManager", advancedTestManager);

    return advancedTestManager;
  }

  public void print(String string) {
    String varId = buildUniqueVariableName();
    setVariable(varId, string);
    karateObject.engine.print(varId);
  }

  public void print(Object string) {
    String mapped = JsonConverter.serializePojo(string);
    String varId = buildUniqueVariableName();

    setVariable(varId, mapped);
    karateObject.engine.print(varId);
  }

  private void setVariable(String key, Object value) {
    karateObject.engine.setVariable(key, value);
  }

  private String buildUniqueVariableName() {
    return "varTempName" +
        UUID.randomUUID().toString().replace("-", "") +
        Instant.now().toEpochMilli();
  }

}
