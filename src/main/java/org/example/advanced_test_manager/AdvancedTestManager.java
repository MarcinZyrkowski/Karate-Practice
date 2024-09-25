package org.example.advanced_test_manager;

import com.intuit.karate.JsonUtils;
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

  public void print(Object obj) {
    String serialized = JsonConverter.serializePojo(obj);
    printString(serialized);
  }

  private void printString(String string) {
    karateObject.engine.print("`"+string+"`");
  }

  public void printJson(Object obj) {
    String serialized = JsonConverter.serializePojo(obj);
    Object json = JsonUtils.toJson(obj, true);
    String varId = buildUniqueVariableName();

    setVariable(varId, json);
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
