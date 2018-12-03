package wdid.Users;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class WDIDUserTest {

    @Test
    void WDIDUserTest_constructor() {
        String email = "test@gmail.com";
        String name = "test";
        WDIDUser user = new WDIDUser(email, name);
        assertEquals(user.getEmail(), email);
        assertEquals(user.diet.length, 4);
        assertEquals(user.movie.length, 6);
    }
}