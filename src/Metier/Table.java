package metier;

import java.util.List;

public class Table {
	// Attributs + accesseurs
	private byte Id;
	private boolean Libre;
	private List<Commande> LstCommandes;
	
	public byte getId() {
		return Id;
	}

	public void setId(byte id) {
		Id = id;
	}

	public boolean isLibre() {
		return Libre;
	}

	public void setLibre(boolean libre) {
		Libre = libre;
	}



	// Constructeurs

	public Table(byte id, boolean libre, List<Commande> lstCommandes) {
		this.Id = id;
		this.Libre = libre;
		this.LstCommandes = lstCommandes;
	}

	// Methodes

}
