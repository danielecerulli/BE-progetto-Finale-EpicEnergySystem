package it.epicode.be.energy.model;



import java.util.List;

//import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@Builder(setterPrefix = "with")
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
public class Provincia extends BaseEntity {

	//@Column(length = 2)
	private String sigla;
	private String nome;
	private String regione;
	/*@OneToMany(mappedBy = "provincia")
	@JsonIdentityInfo(generator = ObjectIdGenerators.PropertyGenerator.class, property = "id")
	private List<Comune> comuni;*/

}
