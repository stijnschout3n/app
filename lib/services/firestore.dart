import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:app/services/auth.dart';
import 'package:app/services/models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Reads all documments from the topics collection
  Future<List<Customer>> getCustomersRelatedToUser() async {
    var ref = _db.collection('customers').where('uid', isEqualTo: AuthService().user!.uid.toString());
    var snapshot = await ref.get();
    var data = snapshot.docs.map((s) => s.data());
    var customers = data.map((d) => Customer.fromJson(d));
    return customers.toList();
  }

  /// Creates a new customer to the firestore database
  Future<void> addCustomer(Customer customer) async {
    DocumentReference doc = _db.collection('customers').doc();
    customer.fid = doc.id;
    doc.set(customer.toJson());
  }

  /// Saves an existing customer to the firestore database
  Future<void> saveCustomer(Customer customer) async {
    _db.collection('customers').doc(customer.fid).set(customer.toJson());
  }
}
