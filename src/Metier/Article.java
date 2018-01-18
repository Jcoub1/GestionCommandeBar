package metier;

public class Article {
	
	// Attributs + accesseurs
	
	private short Id;
	private String Nom;
	private float TVA;

	public short getId() {
		return Id;
	}

	public void setId(short id) {
		Id = id;
	}

	public String getNom() {
		return Nom;
	}

	public void setNom(String nom) {
		Nom = nom;
	}

	public float getTVA() {
		return TVA;
	}

	public void setTVA(float tVA) {
		TVA = tVA;
	}

	// Constructeurs

	public Article() {
	}

	public Article(short id, String nom, float tVA) {
		super();
		Id = id;
		Nom = nom;
		TVA = tVA;
	}

	// M�thodes

}
