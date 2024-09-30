import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<Contact> _contacts = [];
  List<Contact> _filteredContacts = [];
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchContacts();
  }

  Future<void> _fetchContacts() async {
    Iterable<Contact> contacts = await ContactsService.getContacts();
    if (mounted) {
      setState(() {
        // Filter contacts to include only those with at least one phone number
        _contacts = contacts.where((contact) => contact.phones?.isNotEmpty == true).toList();
        _filteredContacts = _contacts;
      });
    }
  }

  void _filterContacts(String query) {
    setState(() {
      _searchQuery = query;
      _filteredContacts = _contacts.where((contact) {
        return contact.displayName?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Kontak'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Cari Kontak...',
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: _filterContacts,
            ),
          ),
        ),
      ),
      body: _filteredContacts.isEmpty
          ? const Center(child: Text('Tidak ada kontak ditemukan.'))
          : ListView.builder(
              padding: const EdgeInsets.all(8.0), // Add padding to the list
              itemCount: _filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = _filteredContacts[index];
                return Card(
                  elevation: 2, // Add elevation for shadow effect
                  margin: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ListTile(
                    title: Text(
                      contact.displayName ?? 'No Name',
                      style: const TextStyle(fontWeight: FontWeight.bold), // Bold contact name
                    ),
                    subtitle: Text(contact.phones!.isNotEmpty ? contact.phones!.first.value! : 'No Phone Number'),
                    onTap: () {
                      // Return selected contact to the previous page
                      Navigator.of(context).pop(contact);
                    },
                  ),
                );
              },
            ),
    );
  }
}
