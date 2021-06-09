part of 'widgets.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;

  CategoryCard(this.category);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(category),
          ),
        );
      },
      child: Container(
        width: 257.0,
        height: 179.0,
        padding: EdgeInsets.only(left: 14.0, bottom: 10.0),
        margin: EdgeInsets.only(right: defaultMargin),
        decoration: BoxDecoration(
          color: Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: NetworkImage(
              universalUrl + category.picturePath,
            ),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: Text(
          '${category.name}',
          style: whiteTextStyle.copyWith(fontSize: 18.0, fontWeight: semiBold),
        ),
      ),
    );
  }
}
