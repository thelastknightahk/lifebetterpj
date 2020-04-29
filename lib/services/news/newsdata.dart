class NewsData{
  final String newImage;
  final String title;
  
  NewsData(this.newImage, this.title);
  
  static List<NewsData> healthPost=[
     new NewsData("assets/images/eatapple.jpg", "Eat Apple for ur storemina"),
     new NewsData("assets/images/eatbanana.jpg", "Eat Banana for ur beauty"),
     new NewsData("assets/images/shop1.jpg", "Eligle Shop Type"),
     new NewsData("assets/images/healthnews1.jpg", "Health News One "),
     new NewsData("assets/images/healthnews2.jpg", "Health News Two "),
   ];
   List<NewsData> get healthData{
     return healthPost;
   }
}