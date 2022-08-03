import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contents/providers/domain/company.dart';
import 'package:contents/providers/domain/user.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget(this.user, {Key? key}) : super(key: key);
  final DaoUser? user;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(user!.id),
        ...user!.companies.map((e) => Text(e)).toList(),
        TextButton(
            onPressed: () {
              final doc = FirebaseFirestore.instance.collection('companies').doc();
              DaoCompany dCompany = DaoCompany(
                id: doc.id,
                companyName: 'MyCo',
                paymentInfo: [
                  PaymentInfo(
                    contactInfo: [
                      ContactInfo(name: 'Homer Simpson', phyicalAddress: [
                        DataPair(
                          data: '31',
                        ),
                      ], phone: [
                        DataPair(
                          data: '5551239876',
                        )
                      ], emailAddress: [
                        DataPair(
                          data: 'a@b.c',
                        ),
                      ]),
                    ],
                  ),
                ],
              );
              final y = dCompany.toJson();
              final x = jsonEncode(y);
              print(y);
              doc.set(y);
              // doc.set({
              //   "id": "sMmcpVkZxkd9KcgHheYY",
              //   "companyName": "MyCo",
              //   "paymentInfo": [
              //     {
              //       "type": "primary",
              //       "contactInfo": [
              //         {
              //           "type": "primary",
              //           "name": "Homer Simpson",
              //           "phyicalAddress": [
              //             {"type": "primary", "data": "31"}
              //           ],
              //           "emailAddress": [
              //             {"type": "primary", "data": "a@b.c"}
              //           ],
              //           "phone": [
              //             {"type": "primary", "data": "5551239876"}
              //           ]
              //         }
              //       ]
              //     }
              //   ],
              //   "status": true
              // });
            },
            child: Text('New Entry')),
      ],
    );
  }
}
