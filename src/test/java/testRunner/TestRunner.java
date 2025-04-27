package testRunner;

import com.intuit.karate.junit5.Karate;

import static com.intuit.karate.junit5.Karate.*;

public class TestRunner {

    // Tüm testleri çalıştırır
    @Test
    Karate testAll() {
        return run("classpath:feature");  // Burada tag kullanılmaz, tüm testler çalışır.

    private static final String FEATURE_PATH = "classpath:feature";

    @Karate.Test
    Karate testSmoke() {
        return Karate.run(FEATURE_PATH).tags("@API");
    }

    @Karate.Test
    Karate testRegression() {
        return Karate.run(FEATURE_PATH).tags("@regression");
    }

    @Karate.Test
    Karate testWithoutSmoke() {
        return Karate.run(FEATURE_PATH).tags("~@smoke");
    }

    @Karate.Test
    Karate testAll() {
        return Karate.run(FEATURE_PATH);

    }
}
