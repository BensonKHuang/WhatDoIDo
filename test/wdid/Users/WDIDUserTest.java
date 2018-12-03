package wdid.Users;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class WDIDUserTest {

    @Test
    void WDIDUserTest_constructor() {
        String email = "test@gmail.com";
        String name = "test";
        WDIDUser user = new WDIDUser(email, name);
        assertEquals(email, user.getEmail());
        assertEquals(4, user.diet.length);
        assertEquals(6, user.movie.length);
    }
}