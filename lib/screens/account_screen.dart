import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:shop_app/components/form/form_address.dart';
import 'package:shop_app/components/form/form_contact.dart';
import 'package:shop_app/components/form/form_name.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shop_app/entities/user.dart';

class AccountScreen extends StatefulWidget {
  @override
  _UserComponentState createState() => _UserComponentState();
}

class _UserComponentState extends State<AccountScreen> {
  late User _user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/users/1'));
    final body = response.body;
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final user = User.fromJson(responseData);

      setState(() {
        _user = user;
        _isLoading = false;
      });
    } else {
      print('Failed to fetch user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Container()
        : Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(50),
                  child: ResponsiveGridRow(
                    children: [
                      ResponsiveGridCol(
                        xs: 12,
                        md: 4,
                        child: Container(
                          padding: EdgeInsets.all(25),
                          height: 300,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(_user.image),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 12,
                        md: 8,
                        child: Container(
                          height: 300,
                          alignment: Alignment(0, 0),
                          child: Container(
                            padding: EdgeInsets.all(25),
                            width: MediaQuery.of(context).size.width,
                            child: FormName(
                              firstName: _user.firstName,
                              lastName: _user.lastName,
                              username: _user.username,
                            ),
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 12,
                        md: 6,
                        child: Container(
                          height: 300,
                          padding: EdgeInsets.all(25),
                          alignment: Alignment(0, 0),
                          child: FormContact(
                            phone: _user.phone,
                            email: _user.email,
                          ),
                        ),
                      ),
                      ResponsiveGridCol(
                        xs: 12,
                        md: 6,
                        child: Container(
                          height: 300,
                          padding: EdgeInsets.all(25),
                          alignment: Alignment(0, 0),
                          child: FormAdress(
                            address: _user.address,
                            postalCode: _user.postalCode,
                            city: _user.city,
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          );
  }
}
