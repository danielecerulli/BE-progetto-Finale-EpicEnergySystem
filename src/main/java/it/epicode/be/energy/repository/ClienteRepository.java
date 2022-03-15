package it.epicode.be.energy.repository;

import java.util.Date;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import it.epicode.be.energy.model.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Long> {
	
	@Query("Select c from Cliente c where c.ragioneSociale like '%:s%' ")
	public Page<Cliente> findByParteNome(String s, Pageable pageable);

	@Query("Select c from Cliente c Order by c.sedeLegale.comune.provincia")
	public Page<Cliente> findAllByProvincia(Pageable pageable); // trova i clienti e li ordina in base alla provincia
	
	public Page<Cliente> findAllBySedeLegaleComuneProvinciaSigla(String sigla, Pageable pageable); 

	public Page<Cliente> findAllByDataInserimento(Date dataInserimento, Pageable pageable);

	public Page<Cliente> findAllByDataUltimoContatto(Date dataUltimoContatto, Pageable pageable);

	public Page<Cliente> findAll(Pageable pageable);

	public Page<Cliente> findAllSortedByFatturatoAnnuale(int anno, Pageable pageable);
	
	public Page<Cliente> findByOrderByFatturatoAnnualeDesc(Pageable pageable);

	public Page<Cliente> findByDataInserimento(int d, int m, int y, Pageable pageable);

	public Page<Cliente> findByDataUltimoContatto(int d, int m, int y, Pageable pageable);
	
	public Page<Cliente> findByOrderByNomeContattoAsc(Pageable pageable);
}
