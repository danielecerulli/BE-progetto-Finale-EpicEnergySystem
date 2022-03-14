package it.epicode.be.energy.controller.web;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import io.swagger.v3.oas.annotations.Operation;
import it.epicode.be.energy.model.Cliente;
import it.epicode.be.energy.service.ClienteService;
import it.epicode.be.energy.service.IndirizzoService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/clienti")
public class ClientiControllerWeb {
	
	@Autowired
	ClienteService clienteServ;
	
	@Autowired
	IndirizzoService indirizzoServ;
	
	@GetMapping("/mostraelenco")
	@Operation(description = "Mostra elenco clienti su pagina Thymeleaf")
	public ModelAndView mostraElencoClienti(Pageable pageable) {
		log.info("Elenco clienti su pagina Thymeleaf");
		ModelAndView view = new ModelAndView("elencoclienti");
		view.addObject("listaClienti", clienteServ.findAll(pageable));
		return view;
	}
	
	@GetMapping("/mostraformaggiungi")
	public String mostraFormAggiungi(Cliente cliente, Model model) {
		log.info("form aggiunta cliente");
		//model.addAttribute("listaIndirizzi", clienteServ.findAll());
		return "formCliente";
	}
	
	@PostMapping("/addCliente")
	public String aggiungiCliente(@Valid Cliente cliente, BindingResult result, Model model) {
		log.info("Action aggiunta cliente");
		if (result.hasErrors()) {
			//model.addAttribute("listaIndirizzi", clienteServ.findAll());
			return "formCliente";
		}
		clienteServ.save(cliente);
		return "redirect:/clienti/mostraelenco";
	}
	
	
	@GetMapping("/eliminacliente/{id}")
	public ModelAndView eliminaCliente(@PathVariable Long id, Model model) {
		Optional<Cliente> clienteTempElim = clienteServ.findById(id);
		if (clienteTempElim.isPresent()) {
			clienteServ.delete(id);
			ModelAndView view = new ModelAndView("elencoclienti");
			view.addObject("listaClienti", clienteServ.findAll());
			return view;
		} else {
			return new ModelAndView("error").addObject("message","Cliente con id " + id + " non trovato!");
		}
		
	}
	
}
