package it.epicode.be.energy.controller.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import io.swagger.v3.oas.annotations.Operation;
import it.epicode.be.energy.service.ComuneService;
import it.epicode.be.energy.service.ProvinciaService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/comuni")
public class ComuneControllerWeb {
	
	@Autowired
	ComuneService comuneServ;
	
	@Autowired
	ProvinciaService provinciaServ;
	
	@GetMapping("/mostraelenco")
	@Operation(description = "Mostra elenco comuni su pagina Thymeleaf")
	public ModelAndView mostraElencoComuni(Pageable pageable) {
		log.info("Elenco comuni su pagina Thymeleaf");
		ModelAndView view = new ModelAndView("elencocomuni");
		view.addObject("listaComuni", comuneServ.findAll(pageable));
		return view;
	}

}
