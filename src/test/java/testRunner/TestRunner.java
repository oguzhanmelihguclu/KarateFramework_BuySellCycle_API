package testRunner;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    // Sadece @smoke etiketi ile işaretlenmiş testleri çalıştırır
    @Karate.Test
    Karate testSmoke() {
        return Karate.run("classpath:feature").tags("@smoke");
    }

    // Sadece @regression etiketi ile işaretlenmiş testleri çalıştırır
    @Karate.Test
    Karate testRegression() {
        return Karate.run("classpath:feature").tags("@regression");
    }

    // @smoke etiketi olmayan testleri çalıştırır
    @Karate.Test
    Karate testWithoutSmoke() {
        return Karate.run("classpath:feature").tags("~@smoke");
    }

    // Tüm testleri çalıştırır
    @Karate.Test
    Karate testAll() {
        return Karate.run("classpath:feature");  // Burada tag kullanılmaz, tüm testler çalışır.
    }
}
