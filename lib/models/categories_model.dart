class Categories
{
  final String image,icon;
  final String title;
  final bool isPopular;

  Categories({
    required this.image,
    required this.icon,
    required this.title,
    this.isPopular = false,
  });
}

List<Categories> demoCategories = [
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: 'assets/images/Flash.svg',
    title: 'Flash Sale',
    isPopular: true,
  ),
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: '',
    title: 'Groceries and Drinks',
  ),
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: '',
    title: 'Health and Personal Care',
  ),
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: '',
    title: 'Pets',
  ),
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: '',
    title: 'Fashion and Beauty',
  ),
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: '',
    title: 'Home and DIY',
  ),
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: '',
    title: 'Device & Electronics',
  ),
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: 'assets/images/Bill.svg',
    title: 'Books & Reading',
    isPopular: true,
  ),
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: 'assets/images/Game.svg',
    title: 'Gaming',
    isPopular: true,
  ),
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: 'assets/images/Gift.svg',
    title: 'Toys, Kids & Baby',
    isPopular: true,
  ),
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: '',
    title: 'Automotive',
  ),
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: '',
    title: 'Office & Professional',
  ),
  Categories(
    image: 'assets/images/Flash_Sale.png',
    icon: 'assets/images/compass.svg',
    title: 'Sports & Outdoors',
    isPopular: true,
  ),
];