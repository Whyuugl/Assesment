import 'package:flutter/material.dart';

class PersonalDetail extends StatelessWidget {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String personalId;
  final String address;
  final DateTime selectedDate;

  PersonalDetail({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.personalId,
    required this.address,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Personal'),
        backgroundColor:
            Colors.blue, // Ganti warna latar belakang sesuai keinginan
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nama Lengkap: $fullName', style: TextStyle(fontSize: 18)),
            Text('Email: $email', style: TextStyle(fontSize: 18)),
            Text('Nomor Telepon: $phoneNumber', style: TextStyle(fontSize: 18)),
            Text('Nomor ID Personal: $personalId',
                style: TextStyle(fontSize: 18)),
            Text('Alamat: $address', style: TextStyle(fontSize: 18)),
            Text('Tanggal Terpilih: ${selectedDate.toLocal()}'.split(' ')[0],
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
