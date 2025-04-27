package testRunner;

import com.intuit.karate.junit5.Karate;

import static com.intuit.karate.junit5.Karate.*;

public class TestRunner {

    // Sadece @smoke etiketi ile işaretlenmiş testleri çalıştırır
    @Test
    Karate testSmoke() {
        return run("classpath:feature").tags("@smoke");
    }

    // Sadece @regression etiketi ile işaretlenmiş testleri çalıştırır
    @Test
    Karate testRegression() {
        return run("classpath:feature").tags("@regression");
    }

    // @smoke etiketi olmayan testleri çalıştırır
    @Test
    Karate testWithoutSmoke() {
        return run("classpath:feature").tags("~@smoke");
    }

    // Tüm testleri çalıştırır
    @Test
    Karate testAll() {
        return run("classpath:feature");  // Burada tag kullanılmaz, tüm testler çalışır.
    }
}
