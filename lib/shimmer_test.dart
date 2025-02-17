import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:async';

class ShimmerWithLoading extends StatefulWidget {
  @override
  _ShimmerWithLoadingState createState() => _ShimmerWithLoadingState();
}

class _ShimmerWithLoadingState extends State<ShimmerWithLoading> {
  bool _isLoading = true;
  final List<String> _names = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];

  @override
  void initState() {
    super.initState();
    // Simulate a network call with a 5-second delay
    Timer(Duration(seconds: 5), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shimmer Example')),
      body: _isLoading
          ? ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                );
              },
            )
          : ListView.builder(
              itemCount: _names.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        _names[index],
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}


