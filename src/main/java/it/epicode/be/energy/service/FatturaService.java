package it.epicode.be.energy.service;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import it.epicode.be.energy.model.Fattura;
import it.epicode.be.energy.repository.FatturaRepository;

@Service
public class FatturaService {

	@Autowired
	FatturaRepository fatturaRepo;

	public Page<Fattura> findByStato(String statoFatt, Pageable pageable) {
		try {
			Page<Fattura> fatture = fatturaRepo.findAllByStato(statoFatt, pageable);
			if (fatture.hasContent()) {
				return fatture;
			} else
				return null;
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

	}

	public Page<Fattura> findByData(int day, int month, int year, Pageable pageable) {
		try {
			Calendar cal = Calendar.getInstance();
			cal.set(year, month, day);
			Date data = cal.getTime();
			return fatturaRepo.findAllByData(data, pageable);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

	}

	public Page<Fattura> findFatturaByClienteId(Long idCliente, Pageable pageable) {
		try {
			return fatturaRepo.findFatturaByIdCliente(idCliente, pageable);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}

	}

	public Page<Fattura> findByAnno(int anno, Pageable pageable) {
		try {
			return fatturaRepo.findAllByAnno(anno, pageable);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	
	}
	
	public Page<Fattura> findByRange(BigDecimal min, BigDecimal max, Pageable pageable) {
		try {
			return fatturaRepo.findByRange(min, max, pageable);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
	
	}

	public Fattura save(Fattura fattura) {
		return fatturaRepo.save(fattura);
	}

	public void delete(Long id) {		
		fatturaRepo.deleteById(id);
	}
	
	public Fattura update(Long id, Fattura fattura) {
		Optional<Fattura> fatturaResult = fatturaRepo.findById(id);
		if (fatturaResult.isPresent()) {
			Fattura update = fatturaResult.get();
			update.setNumeroFattura(fattura.getNumeroFattura());
			update.setAnno(fattura.getAnno());
			update.setData(fattura.getData());
			update.setImporto(fattura.getImporto());
			update.setStato(fattura.getStato());
			update.setCliente(fattura.getCliente());
			return fatturaRepo.save(update);
		}
		return null; // TODO implementare eccezione relativa.
	}
	
	public Page<Fattura> findAll(Pageable pageable) {
		return fatturaRepo.findAll(pageable);
	}

}
