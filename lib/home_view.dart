     

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
 
import 'contact_details_view.dart';
import 'contact_model.dart';
 
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
 
  final ScrollController _scrollController = ScrollController();
 
  final List<Map<String, String>> data = [
    {
      "name": "Ishaaq Abdullai",
      "phone": "+49 1593 899 200 1",
      "email": "ishaaq.ac@gmail.com",
      "country": "Germany",
      "region": "Bayern Munich"
    },
    {
      "name": "Kwame Osei",
      "phone": "434-5712",
      "email": "tempor.diam@hotmail.com",
      "country": "Brazil",
      "region": "Huáběi"
    },
    {
      "name": "Daniel Kessey",
      "phone": "1-567-743-4341",
      "email": "dan2021@google.com",
      "country": "India",
      "region": "Loreto"
    },
    {
      "name": "Manan Abdul Rahman",
      "phone": "+233 24 170 390",
      "email": "man_23425@gmail.com",
      "country": "Cech Republic",
      "region": "Brno"
    },
    {
      "name": "Michael Jojo Okyere",
      "phone": "+233 24 771 1206 ",
      "email": "jojomichael@yahoo.com",
      "country": "united Kindom",
      "region": "London"
    },
    {
      "name": "Mohammed Abdullai",
      "phone": "+233 246 718 497",
      "email": "moabdulai@icloud.org",
      "country": "united States of America",
      "region": "Califonia"
    },
    {
      "name": "Suala Osman",
      "phone": "+1 604 618 3396",
      "email": "non@yahoo.couk",
      "country": "Canada",
      "region": "Vancouver"
    },
    {
      "name": "Farouk Abdul Rahman",
      "phone": "1-412-819-7163",
      "email": "molestie.in@yahoo.ca",
      "country": "Canada",
      "region": "New Island"
    },
    {
      "name": "Abdul Jawad Abdul Rahman",
      "phone": "1-241-690-5206",
      "email": "non@google.couk",
      "country": "United States of America",
      "region": "North Carolina"
    },
    {
      "name": "Shamasiya Abdul Rahman",
      "phone": "1-768-578-0868",
      "email": "sagittis.augue@google.edu",
      "country": "Sweden",
      "region": "Stochholm"
    }
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'My Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage('images/avatar.png'),
              ),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Search by name or number',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          controller: _scrollController,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Recent',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ContactDetailsView(
                            contact: Contact(
                                country: 'Ghana',
                                email: 'iam.sanuci@gmail.com',
                                name: 'Sanusi Abdul',
                                phone: '+233 24 91 18 565',
                                region: 'Greater Accra'));
                      }));
                    },
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('images/person_1.jpg'),
                    ),
                    title: const Text(
                      'Sanusi Abdul',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: const Text('+233 24 91 18 565'),
                    trailing: const IconButton(
                        onPressed: null, icon: Icon(Icons.more_horiz)),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    indent: 25,
                    thickness: 2,
                  );
                },
                itemCount: 3),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Contacts',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    groupByValue.substring(0, 1),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: contact,
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('images/person_2.jpg'),
                      ),
                      title: Text(
                        '${element['name']}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text('${element['phone']}'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)),
                    ),
                    const Divider(
                      indent: 25,
                      thickness: 2,
                    )
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xff1A4ADA),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
 