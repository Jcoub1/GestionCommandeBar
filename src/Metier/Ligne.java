package metier;

public class Ligne {
	// Attributs + accesseurs
	
	private byte Id;
	private Article Article;
	private boolean Paye;

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

	public boolean isPaye() {
		return Paye;
	}

	public void setPaye(boolean paye) {
		Paye = paye;
	}

	// Constructeurs

	public Ligne() {

	}

	public Ligne(byte id, metier.Article article, boolean paye) {
		super();
		Id = id;
		Article = article;
		Paye = paye;
	}

	// Methodes

}
