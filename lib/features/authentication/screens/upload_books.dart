import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Adminupload extends StatefulWidget {
  const Adminupload({super.key});

  @override
  State<Adminupload> createState() => _AdminuploadState();
}

class _AdminuploadState extends State<Adminupload> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _urlController = TextEditingController();
  bool _isUploading = false;

  Future<void> _uploadPdf() async {
    if (_titleController.text.isEmpty ||
        _authorController.text.isEmpty ||
        _urlController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    setState(() => _isUploading = true);

    try {
      await FirebaseFirestore.instance.collection('books').add({
        'title': _titleController.text,
        'author': _authorController.text,
        'pdfUrl': _urlController.text,
        'available': true,
        'createdAt': FieldValue.serverTimestamp(),
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Book uploaded')),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Book not uploaded: $e')));
      }
    } finally {
      if (mounted) {
        setState(() => _isUploading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload Book')),
      body: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Book Title'),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _authorController,
              decoration: const InputDecoration(labelText: 'Author'),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(labelText: 'Book URL'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isUploading? null : _uploadPdf,
                child:
                    _isUploading
                        ? const CircularProgressIndicator()
                        : const Text('Upload Book'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
     _titleController.dispose();
    _authorController.dispose() ;
    _urlController.dispose();
    super.dispose();
  }
}
