import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'index.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  List<dynamic> _searchResults = [];
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    if (_searchController.text.isNotEmpty) {
      _performSearch(_searchController.text);
    } else {
      setState(() => _searchResults.clear());
    }
  }

  _performSearch(String query) async {
    Query searchQuery = _databaseReference.child('Users').orderByChild('name').startAt(query).endAt('$query\uf8ff');

    final snapshot = await searchQuery.get();
    if (snapshot.exists) {
      List<dynamic> results = [];
      snapshot.children.forEach((result) {
        results.add(result.value);
      });

      setState(() => _searchResults = results);
    } else {
      setState(() => _searchResults.clear());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4,
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xffad32fe),
      title: !_isSearching
          ? GestureDetector(
        onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
        child: Row(
          children: [
            Image.asset('assets/logo.png', width: 24),
            SizedBox(width: 8),
            Text("Study Hive", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.white)),
          ],
        ),
      )
          : TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search...",
          hintStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
        ),
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        if (!_isSearching)
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {
              setState(() {
                _isSearching = true;
              });
            },
          ),
        IconButton(
          icon: Icon(Icons.settings, color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
          },
        ),
        if (_isSearching)
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              setState(() {
                _isSearching = false;
                _searchController.clear();
                _searchResults.clear();
              });
            },
          ),
      ],
    );
  }
}
