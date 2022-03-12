package it.epicode.be.energy.model;


import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
//import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
//import lombok.NonNull;

@Data
@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder(setterPrefix = "with")
@Inheritance(strategy = InheritanceType.SINGLE_TABLE)
public class Cliente extends BaseEntity {
	private String ragioneSociale;
	private String iva;
	private String email;
	private Date dataInserimento;
	private Date dataUltimoContatto;
	private BigDecimal fatturatoAnnuale;
	private String pec;
	private String telefono;
	
	@OneToOne(cascade = CascadeType.ALL)
	private Indirizzo sedeLegale;
	
	@OneToOne(cascade= CascadeType.ALL)
	private Indirizzo sedeOperativa;	

	@Enumerated(EnumType.STRING)
	private TipoCliente tipoCliente;
	
	
	/*@OneToOne(cascade=CascadeType.ALL)
	private Contatto contatto;*/
	
	private String emailContatto;
	private String nomeContatto;
	private String cognomeContatto;
	private String telefonoContatto;
	
	public final void setDataInserimento() {
		this.dataInserimento=new Date();
	} 
}
