package examples.users;

import com.intuit.karate.junit5.Karate;

public class ShortenRunner {

    @Karate.Test
    Karate testShorten() {
        return Karate.run("shorten").relativeTo(getClass());
    }

    //  mvn clean test -D"karate.options=--tags @Tag"
}
