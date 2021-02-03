package models;

public class PWA {
	static private String[] categories = {"entertainment", "food", "fitness", "sports", "education"}; 
	private String pwaId;
	private String userName;
	private String name;
	private String logo;
	private String category;
	private String description;
	private String link;
	private int samplePicsCount;
	private int views;
	

	
	public PWA(String pwaId, String userName, String name, String logo, String category, String description,
			String link, int samplePicsCount) {
//		super();
		this.pwaId = pwaId;
		this.userName = userName;
		this.name = name;
		this.logo = logo;
		this.category = category;
		this.description = description;
		this.link = link;
		this.samplePicsCount = samplePicsCount;
		this.views = 0;
	}
	
	public PWA(String pwaId, String userName, String name, String logo, String category, String description,
			String link, int samplePicsCount, int views) {
//		super();
		this.pwaId = pwaId;
		this.userName = userName;
		this.name = name;
		this.logo = logo;
		this.category = category;
		this.description = description;
		this.link = link;
		this.samplePicsCount = samplePicsCount;
		this.views = views;
	}
	
	public static String[] getCategories() {
		return categories;
	}
	public String getPwaId() {
		return pwaId;
	}
	public void setPwaId(String pwaId) {
		this.pwaId = pwaId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getSamplePicsCount() {
		return samplePicsCount;
	}
	public void setSamplePics(int samplePicsCount) {
		this.samplePicsCount = samplePicsCount;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
	
}
