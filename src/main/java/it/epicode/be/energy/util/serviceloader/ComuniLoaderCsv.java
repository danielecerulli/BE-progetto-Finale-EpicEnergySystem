package it.epicode.be.energy.util.serviceloader;

import java.io.FileNotFoundException;
//import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
//import java.util.Optional;

//import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.opencsv.CSVParser;
import com.opencsv.CSVParserBuilder;
import com.opencsv.CSVReader;
import com.opencsv.CSVReaderBuilder;

import it.epicode.be.energy.model.Comune;
import it.epicode.be.energy.model.Provincia;
import it.epicode.be.energy.service.ComuneService;
import it.epicode.be.energy.service.ProvinciaService;

@Service
public class ComuniLoaderCsv {
	
	@Autowired
	ComuneService comuneService;

	@Autowired
	ProvinciaService provinciaService;

	public String popola() throws IOException {
		try (CSVReader csvReader = new CSVReader(new FileReader("Elenco-comuni-italiani-virgole.csv"));) {
			String[] values = null;
			csvReader.readNext(); // primo readNext per saltare la riga (intestazione)
			while ((values = csvReader.readNext()) != null) {
				
				String nomeComune = values[5];
				String regione = values[10];
				String nome = values[11];
				String sigla = values[14];
				
				Provincia p = new Provincia();
				p.setRegione(regione);
				p.setNome(nome);
				p.setSigla(sigla);
				provinciaService.save(p);		
				comuneService.save(new Comune(nomeComune, p));

			}

		}
		return "DB popolato correttamente!";

	}
	
	/*public void caricaComuni() {
        CSVParser csvParser = new CSVParserBuilder().withSeparator(';').build();
        try (CSVReader reader = new CSVReaderBuilder(
                  new FileReader("comuniitaliani.csv"))
                  .withCSVParser(csvParser)
                  .withSkipLines(1)
                  .build()) {
            Object[] values = null;

            while ((values = reader.readNext()) != null) {
                comuneService.save(new Comune(values[0], values[1], values[2], values[3]));
            }
        } catch (FileNotFoundException e) {

            e.printStackTrace();
        } catch (IOException e) {

            e.printStackTrace();
        }

	}*/
	
	/*public void caricaProvince() {
    CSVParser csvParser = new CSVParserBuilder().withSeparator(';').build();
    try (CSVReader reader = new CSVReaderBuilder(
              new FileReader("provinceitaliane.csv"))
              .withCSVParser(csvParser)
              .withSkipLines(1)
              .build()) {
        Object[] values = null;

        while ((values = reader.readNext()) != null) {
            comuneService.save(new Provincia(values[0], values[1], values[2], values[3]));
        }
    } catch (FileNotFoundException e) {

        e.printStackTrace();
    } catch (IOException e) {

        e.printStackTrace();
    }

}*/

}
