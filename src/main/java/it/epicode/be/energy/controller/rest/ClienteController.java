package it.epicode.be.energy.controller.rest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.security.SecurityRequirement;
import it.epicode.be.energy.model.Cliente;
import it.epicode.be.energy.service.ClienteService;

@RestController
@RequestMapping(path = "/api")
@SecurityRequirement(name = "bearerAuth")
public class ClienteController {

	@Autowired
	ClienteService clienteServ;

	@PostMapping(path = "/cliente")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Operation(description = "Inserisce un nuovo cliente nel Db")
	public ResponseEntity<Cliente> save(@RequestBody Cliente cliente) {
		Cliente save = clienteServ.save(cliente);
		return new ResponseEntity<>(save, HttpStatus.CREATED);

	}

	@DeleteMapping(path = "/cliente/{id}")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Operation(description = "Elimina un cliente dal Db")
	public ResponseEntity<String> delete(@PathVariable Long id) {
		clienteServ.delete(id);
		return new ResponseEntity<>("Cliente cancellato con successo!", HttpStatus.OK);

	}

	@PutMapping(path = "/cliente/{id}")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@Operation(description = "Aggiorna un cliente presente nel Db")
	public ResponseEntity<Cliente> update(@PathVariable Long id, @RequestBody Cliente cliente) {
		Cliente update = clienteServ.update(id, cliente);
		return new ResponseEntity<>(update, HttpStatus.OK);

	}

	@GetMapping(path = "/clientesortedfatturatoannuale/{anno}")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
	@Operation(description = "Ricerca clienti in base all'anno ed ordinamento in base al fatturato annuale")
	public ResponseEntity<Page<Cliente>> findAllSortedByFatturatoAnnuale(@PathVariable(required = true) int anno,
			Pageable pageable) {
		Page<Cliente> find = clienteServ.findAllSortedByFatturatoAnnuale(anno, pageable);

		if (find.hasContent()) {
			return new ResponseEntity<>(find, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
		}

	}

	@GetMapping(path = "/clientesortedall/{page}/{size}/{sort}")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
	@Operation(description = "Ricerca di tutti i clienti con paginazione")
	public ResponseEntity<Page<Cliente>> findAllSorted(@PathVariable(required = true) Integer page,
			@PathVariable(required = true) Integer size, @PathVariable(required = true) String sort,
			Pageable pageable) {
		Page<Cliente> find = clienteServ.findAllSorted(page, size, sort);

		if (find.hasContent()) {
			return new ResponseEntity<>(find, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
		}

	}

	@GetMapping(path = "/clientedataultimocontatto/{d}/{m}/{y}")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
	@Operation(description = "Ricerca clienti in base alla data ultimo contatto")
	public ResponseEntity<Page<Cliente>> findAllByDataUltimoContatto(@PathVariable(required = true) int d,
			@PathVariable(required = true) int m, @PathVariable(required = true) int y, Pageable pageable) {

		Page<Cliente> find = clienteServ.findByDataUltimoContatto(d, m, y, pageable);

		if (find.hasContent()) {
			return new ResponseEntity<>(find, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
		}

	}

	@GetMapping(path = "/clientedatainserimento/{d}/{m}/{y}")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
	@Operation(description = "Ricerca clienti in base alla data di inserimento")
	public ResponseEntity<Page<Cliente>> findAllByDataInserimento(@PathVariable(required = true) int d,
			@PathVariable(required = true) int m, @PathVariable(required = true) int y, Pageable pageable) {

		Page<Cliente> find = clienteServ.findByDataInserimento(d, m, y, pageable);

		if (find.hasContent()) {
			return new ResponseEntity<>(find, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
		}

	}
	
	@GetMapping(path = "/clientepartenome/{nome}")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
	@Operation(description = "Ricerca clienti in base al nome (anche parziale)")
	public ResponseEntity<Page<Cliente>> findAllByParteNome(@PathVariable(required = true) String nome,
			Pageable pageable) {
		Page<Cliente> find = clienteServ.findByParteNome(nome, pageable);

		if (find.hasContent()) {
			return new ResponseEntity<>(find, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
		}

	}
	
	@GetMapping(path = "/clienteprovincia/{siglaProvincia}")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
	@Operation(description = "Ricerca clienti in base alla sigla della provincia")
	public ResponseEntity<Page<Cliente>> findAllByProvinciaSigla(@PathVariable(required = true) String siglaProvincia,
			Pageable pageable) {
		Page<Cliente> find = clienteServ.findAllByProvinciaSigla(siglaProvincia, pageable);

		if (find.hasContent()) {
			return new ResponseEntity<>(find, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
		}

	}
	
	@GetMapping(path = "/allclienteorderbynomecontatto")
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
	@Operation(description = "Ricerca di tutti i clienti con ordinamento alfabetico")
	public ResponseEntity<Page<Cliente>> findByOrderByNomeContattoAsc(Pageable pageable) {
		Page<Cliente> find = clienteServ.findByOrderByNomeContattoAsc(pageable);

		if (find.hasContent()) {
			return new ResponseEntity<>(find, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
		}

	}

}
