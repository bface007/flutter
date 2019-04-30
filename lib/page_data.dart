class Cast {
  String name;
  String image;

  Cast(this.name, this.image);
}

class PageData {
  String title;
  String publishedDate;
  String image;
  List<Cast> cast;

  PageData(this.title, this.publishedDate, this.image, this.cast);
}

List<PageData> pageDatas = [
  PageData("Star Wars: The Last Jedi", "NEW THIS WEEK", "assets/image_01.jpg", starWarsCast),
  PageData("Blade Runner 2049", "NEW THIS WEEK", "assets/image_02.jpg", bladeRunnerCast),
  PageData("Tomb Raider", "NEW THIS WEEK", "assets/image_03.jpg", tombRaiderCast),
];

List<Cast> starWarsCast = [
  Cast("Mark Hamill", "assets/mark_hamill.jpg"), 
  Cast("Carrie Fisher", "assets/carrie_fisher.jpg"), 
  Cast("Adam Driver", "assets/adam_driver.jpg"),
  Cast("Daisy Ridley", "assets/daisy_ridley.jpg"),
];

List<Cast> bladeRunnerCast = [
  Cast("Ryan Gosling", "assets/ryan_gosling.jpg"),
  Cast("Dave Bautista", "assets/dave_bautista.jpg"),
  Cast("Robin Wright", "assets/robin_wright.jpg"),
  Cast("Mark Arnold", "assets/mark_arnold.jpg")
];

List<Cast> tombRaiderCast =  [
  Cast("Alicia Vikander", "assets/alicia_vikander.jpg"),
  Cast("Dominic West", "assets/dominic_west.jpg"),
  Cast("Walton Goggins", "assets/walton_goggins.jpg"),
  Cast("Daniel Wu", "assets/daniel_wu.jpg"),
];