package Metier;

import java.util.List;

public class Table {
	// Attributs + accesseurs
	private byte Id;
	private boolean Libre;
	private List<Commande> LstCommandes;

	// Constructeurs

	public Table(byte id, boolean libre, List<Commande> lstCommandes) {
		Id = id;
		Libre = libre;
		LstCommandes = lstCommandes;
	}

	// Méthodes

}
