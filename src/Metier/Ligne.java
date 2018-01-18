package Metier;

public class Ligne {
	// Attributs + accesseurs
	
	private byte Id;
	private Article Article;
	private boolean Pay�;

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

	public boolean isPay�() {
		return Pay�;
	}

	public void setPay�(boolean pay�) {
		Pay� = pay�;
	}

	// Constructeurs

	public Ligne() {

	}

	public Ligne(byte id, Metier.Article article, boolean pay�) {
		super();
		Id = id;
		Article = article;
		Pay� = pay�;
	}

	// Methodes

}
