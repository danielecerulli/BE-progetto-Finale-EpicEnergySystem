package it.epicode.be.energy.model;

import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper = false)
@Builder(setterPrefix = "with")
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Indirizzo extends BaseEntity {
	private String via;
	private int civico;
	private String localita;
	private Long cap;
	@ManyToOne
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
	private Comune comune;
	
}
