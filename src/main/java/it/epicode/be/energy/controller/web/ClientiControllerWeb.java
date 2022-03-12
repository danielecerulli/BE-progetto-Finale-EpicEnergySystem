package it.epicode.be.energy.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import io.swagger.v3.oas.annotations.Operation;
import it.epicode.be.energy.service.ClienteService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/clienti")
public class ClientiControllerWeb {
	
	@Autowired
	ClienteService clienteServ;
	
	@GetMapping("/mostraelenco")
	@Operation(description = "Mostra elenco clienti su pagina Thymeleaf")
	public ModelAndView mostraElencoClienti(Pageable pageable) {
		log.info("Elenco comuni su pagina Thymeleaf");
		ModelAndView view = new ModelAndView("elencoclienti");
		view.addObject("listaClienti", clienteServ.findAll(pageable));
		return view;
	}

}
