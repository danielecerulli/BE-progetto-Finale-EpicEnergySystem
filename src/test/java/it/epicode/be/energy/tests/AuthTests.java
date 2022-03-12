package it.epicode.be.energy.tests;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

@SpringBootTest
@AutoConfigureMockMvc
public class AuthTests {
	
	@Autowired
	private MockMvc mockMvc;


	@Test
	@WithAnonymousUser
	public void listaComuniWhenUtenteIsAnonymous() throws Exception {
		this.mockMvc.perform(get("/api/comune")).andExpect(status().isUnauthorized());
	}


	@Test
	@WithMockUser(username = "admin", password = "admin", roles = "USER")
	public void listaComuniWhenUtenteMockIsAuthenticated() throws Exception {
		this.mockMvc.perform(get("/api/comune")).andExpect(status().isOk());
	}



	@Test
	@WithMockUser(username = "admin", password = "admin", roles = "USER")
	public void deleteComuneByUser() throws Exception {
		this.mockMvc.perform(delete("/api/comune/9"))
			.andExpect(status().isForbidden());
	}
	
	@Test
	@WithMockUser(username = "admin", password = "admin", roles = "ADMIN")
	public void deleteComuneByAdmin() throws Exception {
		this.mockMvc.perform(delete("/api/comune/9"))
			.andExpect(status().isOk());
	}

}
