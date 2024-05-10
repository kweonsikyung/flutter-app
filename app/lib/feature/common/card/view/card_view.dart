import 'package:app/src/colors.dart';
import 'package:app/src/fonts.dart';
import 'package:flutter/material.dart';
import 'package:app/src/constant/enum/tag_type_enum.dart';

/// 이미지, 제목, 설명을 갖는 카드형 위젯
class CardWidget extends StatelessWidget {
  /** 제목 */
  final String title;
  /** 설명 */
  final String description;
  /** 이미지 경로 ('assets/ ***') */
  final String imagePath;

  const CardWidget({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                width: 200,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Text(
              title,
              style: FontSystem.body1,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.person,
                color: ColorSystem.Secondary,
                size: 20,
              ),
              SizedBox(width: 5),
              Text(
                description,
                style: FontSystem.body2,
              ),
            ],
          )
        ],
      ),
    );
  }
}

/// type 태그로 필터링 된 카드를 반환하는 카드리스트위젯
class MultipleCardWidgets extends StatefulWidget {
  /** 데이터 */
  final List<Map<String, String>> dataList;
  /** 필터링할 태그 데이터 */
  final List<String> tagData;

  const MultipleCardWidgets({
    Key? key,
    required this.dataList,
    required this.tagData,
  }) : super(key: key);

  @override
  _MultipleCardWidgetsState createState() => _MultipleCardWidgetsState();
}

class _MultipleCardWidgetsState extends State<MultipleCardWidgets> {
  late List<Map<String, String>> filteredData;
  late String selectedTag;

  @override
  void initState() {
    super.initState();
    selectedTag = widget.tagData.first;
    filteredData =
        widget.dataList.where((data) => data['type'] == selectedTag).toList();
  }

  void filterData(String tag) {
    setState(() {
      filteredData =
          widget.dataList.where((data) => data['type'] == tag).toList();
      selectedTag = tag;
    });
  }

  String tagToString(String tag) {
    switch (tag) {
      case 'animal':
        return TagType.animal.title;
      case 'family':
        return TagType.family.title;
      case 'friend':
        return TagType.friend.title;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '📖 연재중인 동화책',
            style: FontSystem.title,
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 45,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(widget.tagData.length, (index) {
                final tag = widget.tagData[index];
                return GestureDetector(
                  onTap: () {
                    filterData(tag);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 5),
                    height: 45,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: selectedTag == tag
                            ? ColorSystem.Primary
                            : Colors.white,
                        border: Border.all(
                          color: ColorSystem.Primary,
                          width: 1,
                        )),
                    child: Center(
                      child: Text(
                        tagToString(tag),
                        style: TextStyle(
                          color:
                              selectedTag == tag ? Colors.white : Colors.black,
                          fontWeight: selectedTag == tag
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                final item = filteredData[index];
                return SizedBox(
                  width: MediaQuery.of(context).size.width - 170,
                  child: CardWidget(
                    imagePath: item['imagePath'] ?? '',
                    title: item['title'] ?? '',
                    description: item['description'] ?? '',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
