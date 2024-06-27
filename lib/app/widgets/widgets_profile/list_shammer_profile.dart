import 'package:flutter/material.dart';

import '../color/appcolor.dart';

class ListshimmerProfile extends StatelessWidget {
  const ListshimmerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
      ),
      child: Column(
        children: [

          const CircleAvatar(
            backgroundImage: NetworkImage('',
            ),
            backgroundColor: AppColors.shammerColor,
            radius: 40,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 90,
            height: 20,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.shammerColor,
            ),
            child: const Center(
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 90,
            height: 20,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.shammerColor,
            ),
            child: const Center(
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 200,
            height: 30,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.shammerColor,
            ),
            child: const Center(
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 20,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.shammerColor,
                ),
                child: const Center(
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                width: 90,
                height: 20,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.shammerColor,
                ),
                child: const Center(
                ),
              ),
            ],),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 90,
            height: 20,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.shammerColor,
            ),
            child: const Center(
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 90,
            height: 20,
            padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.shammerColor,
            ),
            child: const Center(
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 5,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('No. Telp :'),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 90,
                height: 20,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.shammerColor,
                ),
                child: const Center(
                ),
              ),
            ],),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('No. Telp :'),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 90,
                height: 20,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.shammerColor,
                ),
                child: const Center(
                ),
              ),
            ],),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('No. Telp :'),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 90,
                height: 20,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.shammerColor,
                ),
                child: const Center(
                ),
              ),
            ],),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
   }
}