import 'package:flutter/material.dart';

class PersonalDataForm extends StatefulWidget {
  @override
  _PersonalDataFormState createState() => _PersonalDataFormState();
}

class _PersonalDataFormState extends State<PersonalDataForm> {
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _personalidController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Data Personal'),
      ),
      body: Padding(
        padding: EdgeInsets.all(17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Full Name',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Chivo',
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              controller: _fullnameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Full Name'),
            ),
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Email'),
            ),
            const Text(
              'Enter Number',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter Number'),
            ),
            const Text(
              'Personal Id Number',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              controller: _personalidController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Personal ID Number'),
            ),
            const Text(
              'Address',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Address'),
            ),
            ListTile(
              title: Text("Tanggal Lahir"),
              subtitle: _selectedDate == null
                  ? Text("Pilih Tanggal")
                  : Text("${_selectedDate}".split(' ')[0]),
              //.toLocal()
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),
            SizedBox(height: 20, width: 380),
            ElevatedButton(
              onPressed: () {
                String name = _fullnameController.text;
                String email = _emailController.text;
                String address = _addressController.text;
                String birthDate = _selectedDate != null
                    ? "${_selectedDate}".split(' ')[0]
                    //.toLocal()
                    : "Belum Dipilih";

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Data Personal'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Nama: $name'),
                          Text('Email: $email'),
                          Text('Alamat: $address'),
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Tutup'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
