import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.1),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: _loadingWidget(context),
      ),
    );
  }

  Widget _loadingWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.7), blurRadius: 55.0)
          ]),
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: const CircularProgressIndicator(
              strokeWidth: 2.5,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Loading ...",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
