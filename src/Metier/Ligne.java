package Metier;

public class Ligne {
	// Attributs + accesseurs
	
	private byte Id;
	private Article Article;
	private boolean Payé;

	public byte getId() {
		return Id;
	}

	public void setId(byte id) {
		Id = id;
	}

	public Article getArticle() {
		return Article;
	}

	public void setArticle(Article article) {
		Article = article;
	}

	public boolean isPayé() {
		return Payé;
	}

	public void setPayé(boolean payé) {
		Payé = payé;
	}

	// Constructeurs

	public Ligne() {

	}

	public Ligne(byte id, Metier.Article article, boolean payé) {
		super();
		Id = id;
		Article = article;
		Payé = payé;
	}

	// Methodes

}
