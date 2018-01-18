package Metier;

import java.util.Date;
import java.util.List;

public class Commande {
	// Attributs + accesseurs
	
	private byte Id;
	private Date Date;
	private List<Ligne> LstLignes;

	public byte getId() {
		return Id;
	}

	public void setId(byte id) {
		Id = id;
	}

	public Date getDate() {
		return Date;
	}

	public void setDate(Date date) {
		Date = date;
	}

	public List<Ligne> getLstLignes() {
		return LstLignes;
	}

	public void setLstLignes(List<Ligne> lstLignes) {
		LstLignes = lstLignes;
	}

	// Constructeurs

	public Commande() {

	}

	public Commande(byte id, java.util.Date date, List<Ligne> lstLignes) {

		Id = id;
		Date = date;
		LstLignes = lstLignes;
	}
}

// Méthodes
