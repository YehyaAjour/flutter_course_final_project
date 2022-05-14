import '../../../SERVICES/app_imports.dart';

class MyAccountItem extends StatelessWidget {
final String labelName;
final IconData iconData;
final Function onTapItem;

  const MyAccountItem({Key key, this.labelName, this.iconData, this.onTapItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapItem,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: Colors.grey[350],
              ),
            )),
        width: double.infinity,
        height: 75,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(
                iconData,
                color: Color(0xff69A03A),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                labelName,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

