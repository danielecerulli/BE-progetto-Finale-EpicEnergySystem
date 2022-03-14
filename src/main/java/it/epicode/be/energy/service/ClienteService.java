package it.epicode.be.energy.service;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import it.epicode.be.energy.exceptions.EnergyException;
import it.epicode.be.energy.model.Cliente;
import it.epicode.be.energy.model.Fattura;
import it.epicode.be.energy.repository.ClienteRepository;
import it.epicode.be.energy.repository.FatturaRepository;
import it.epicode.be.energy.repository.IndirizzoRepository;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ClienteService {
	
	@Autowired
	ClienteRepository clienteRepo;
	
	@Autowired
	FatturaRepository fatturaRepo;
	
	@Autowired
	IndirizzoRepository indirizzoRepo;

	
	public Page<Cliente> findByParteNome(String nome, Pageable pageable) {
		try {
			Page<Cliente> clienti = clienteRepo.findByParteNome(nome, pageable);
			if (clienti.hasContent()) {
				return clienti;
			}
			log.error("Nessun cliente trovato");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	
	}
	
	public Page<Cliente> findByDataInserimento(int d, int m, int y, Pageable pageable) {
		try {
			Calendar cal = Calendar.getInstance();
			cal.set(y, m, d);
			Date data = cal.getTime();

			return clienteRepo.findAllByDataInserimento(data, pageable);
		} catch (Exception e) {

			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	
	}
	
	public Page<Cliente> findByDataUltimoContatto(int d, int m, int y, Pageable pageable) {
		try {
			Calendar cal = Calendar.getInstance();
			cal.set(y, m, d);
			Date data = cal.getTime();
			return clienteRepo.findAllByDataUltimoContatto(data, pageable);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	
	}
	
	public Page<Cliente> findAllSorted(Integer page, Integer size, String sort) {
		try {
			String[] attributi = { "id", "ragioneSociale", "dataInserimento", "dataUltimoContatto" };
			if (Arrays.stream(attributi).anyMatch(sort::equals)) {
				Pageable pageable = PageRequest.of(page, size, Sort.by(sort));
				Page<Cliente> pageResult = clienteRepo.findAll(pageable);
				if (pageResult.hasContent()) {
					return pageResult;
				} else
					return null;
			}
			log.error("Nessuna corrispondenza trovata");
			return null;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	
	}
	
	public Page<Cliente> findAllSortedByFatturatoAnnuale(int anno, Pageable pageable) {
		try {
			return clienteRepo.findAllSortedByFatturatoAnnuale(anno, pageable);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	
	}
	
	public Page<Fattura> findFatturaByIdCliente(Long id, Pageable pageable) {
		try {
			return fatturaRepo.findFatturaByIdCliente(id, pageable);
		} catch (Exception e) {

			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	
	}
	
	public Cliente save(Cliente cliente) {
		return clienteRepo.save(cliente);
	}
	
	public void delete(Long id) {
		if (clienteRepo.findById(id).isPresent()) {
			Cliente delete = clienteRepo.findById(id).get();
			delete.setSedeLegale(null);
			delete.setSedeOperativa(null);
			clienteRepo.deleteById(id);
		} else {
			throw new EnergyException("Cliente non cancellato/trovato!");
		}
		
	}
	
	public Cliente update(Long id, Cliente cliente) {
		Optional<Cliente> clienteResult = clienteRepo.findById(id);
		if (clienteResult.isPresent()) {
			Cliente update = clienteResult.get();
			update.setRagioneSociale(cliente.getRagioneSociale());
			update.setDataInserimento(cliente.getDataInserimento());
			update.setDataUltimoContatto(cliente.getDataUltimoContatto());
			update.setIva(cliente.getIva());
			update.setNomeContatto(cliente.getNomeContatto());
			update.setCognomeContatto(cliente.getCognomeContatto());
			update.setEmailContatto(cliente.getEmailContatto());
			update.setTelefonoContatto(cliente.getTelefonoContatto());
			update.setFatturatoAnnuale(cliente.getFatturatoAnnuale());
			update.setPec(cliente.getPec());
			update.setEmail(cliente.getEmail());
			update.setSedeLegale(cliente.getSedeLegale());
			update.setSedeOperativa(cliente.getSedeOperativa());
			update.setTelefono(cliente.getTelefono());
			update.setTipoCliente(cliente.getTipoCliente());
			return clienteRepo.save(update);
		}
		return null; // TODO implementare eccezione relativa.
	}
	
	public Page<Cliente> findAllByProvinciaSigla(String siglaProvincia, Pageable pageable) {
		try {
			Page<Cliente> clientiProv = clienteRepo.findAllBySedeLegaleComuneProvinciaSigla(siglaProvincia, pageable);
			if (clientiProv.hasContent()) {
				return clientiProv;
			}
			log.error("Nessun cliente trovato in questa provincia!");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	
	}
	
	public Page<Cliente> findByOrderByNomeContattoAsc(Pageable pageable) {
		try {
			Page<Cliente> clientiNomeAsc = clienteRepo.findByOrderByNomeContattoAsc(pageable);
			if (clientiNomeAsc.hasContent()) {
				return clientiNomeAsc;
			}
			log.error("Nessun cliente trovato!");
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e.getMessage());
		}
	
	}
	
	public Page<Cliente> findAll(Pageable pageable) {
		return clienteRepo.findAll(pageable);
	}
	
	public Optional<Cliente> findById(Long id) {
		return clienteRepo.findById(id);
	}
	
	public List<Cliente> findAll() {
		return clienteRepo.findAll();
	}
	
}
