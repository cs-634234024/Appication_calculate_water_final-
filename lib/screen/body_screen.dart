import 'package:calculate_water_2/widgets/bottom_widget.dart';
import 'package:flutter/material.dart';

class BodyScreen extends StatefulWidget {
  const BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  int type = 0;
  int service = 0;
  int index = 0;
  int changesize = 0;
  double _currenSliderValue = 0;

  void changeIndexSize(int newindex) {
    setState(() {
      changesize = newindex;
      if (changesize > 10) {
        changesize = 10;
      } else if (changesize < 1) {
        changesize = 1;
      }
      print(changesize);
    });
  }

  void changeIndexType(int newindex) {
    setState(() {
      type = newindex;
      if (type > 3) {
        type = 3;
      } else if (type < -3) {
        type = -3;
      }
      print(type);
    });
  }

  void changeIndexService(int newindex) {
    setState(() {
      service = newindex;
      if (service > 3) {
        service = 3;
      } else if (service < -3) {
        service = -3;
      }
      print(service);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            selectType(
                size: size,
                title: 'ประปาที่ใช้บริการ',
                index: 1,
                onclick: changeIndexService,
                type: service),
            selectType(
                size: size,
                title: 'ประเภทผู้ใช้',
                index: 2,
                onclick: changeIndexType,
                type: type),
          ],
        ),
        selectSize(size: size, onclick: changeIndexSize, type: changesize),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: size.width,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.indigo.shade300,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ปริมาณการใช้น้ำ',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    _currenSliderValue.toStringAsFixed(0),
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Text(
                    'หน่วย',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Slider(
                    max: 10000,
                    value: _currenSliderValue,
                    onChanged: (value) {
                      setState(() {
                        _currenSliderValue = value;
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ButtonWidget(
          service: service,
          changesize: changesize,
          type: type,
          water: _currenSliderValue,
        )
      ],
    );
  }
}

class selectType extends StatelessWidget {
  const selectType({
    super.key,
    required this.size,
    required this.title,
    required this.index,
    required this.onclick,
    required this.type,
  });

  final Size size;
  final String title;
  final int index;
  final int type;
  final Function onclick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: size.width,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.indigo.shade300,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () => onclick(type + 1),
                child: Icon(Icons.arrow_upward),
              ),
              const SizedBox(
                height: 7,
              ),
              index == 1 ? TextService(index: type) : TextType(index: type),
              const SizedBox(
                height: 7,
              ),
              ElevatedButton(
                  onPressed: () => onclick(type - 1),
                  child: Icon(Icons.arrow_downward))
            ],
          ),
        ),
      ),
    );
  }
}

class TextType extends StatelessWidget {
  const TextType({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: index == 0
          ? const Text(
              'เลือกประเภทที่ใช้งาน',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          : index == 1 || index == -1
              ? const Text(
                  'ที่อยู่อาศัย',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              : index == 2 || index == -2
                  ? const Text(
                      'ราชการ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  : const Text(
                      'รัฐวิสาหกิจ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
    );
  }
}

class TextService extends StatelessWidget {
  const TextService({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: index == 0
          ? const Text(
              'เลือกบริการที่ใช้งาน',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          : index == 1 || index == -1
              ? const Text(
                  'ทั่วไป',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              : index == 2 || index == -2
                  ? const Text(
                      'กปภ(เกาะ)',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  : const Text(
                      'เอกชน',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
    );
  }
}

class selectSize extends StatelessWidget {
  const selectSize({
    super.key,
    required this.size,
    required this.onclick,
    required this.type,
  });

  final Size size;
  final int type;
  final Function onclick;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: size.width,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.indigo.shade300,
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ขนาดวัดน้ำ',
                style: TextStyle(fontSize: 17, color: Colors.white),
              ),
              const SizedBox(
                height: 15,
              ),
              type == 0
                  ? const Text(
                      'เลือกขนาดวัดน้ำ',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  : type == 1
                      ? const Text(
                          'ขนาด 1/2 นิ้ว',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      : type == 2
                          ? const Text(
                              'ขนาด 3/4 นิ้ว',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          : type == 3
                              ? const Text(
                                  'ขนาด 1 นิ้ว',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              : type == 4
                                  ? const Text(
                                      'ขนาด 1.5 นิ้ว',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )
                                  : type == 5
                                      ? const Text(
                                          'ขนาด 2 นิ้ว',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      : type == 6
                                          ? const Text(
                                              'ขนาด 2.5 นิ้ว',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )
                                          : type == 7
                                              ? const Text(
                                                  'ขนาด 3 นิ้ว',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                )
                                              : type == 8
                                                  ? const Text(
                                                      'ขนาด 4 นิ้ว',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
                                                    )
                                                  : type == 9
                                                      ? const Text(
                                                          'ขนาด 6 นิ้ว',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      : const Text(
                                                          'ขนาด > 6 นิ้ว',
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.white),
                                                        ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () => onclick(type - 1),
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 45),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    heroTag: null,
                    onPressed: () => onclick(type + 1),
                    child: Text('+', style: TextStyle(fontSize: 30)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
