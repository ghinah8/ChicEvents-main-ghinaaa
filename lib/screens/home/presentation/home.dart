// ignore_for_file: camel_case_types, must_be_immutable, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:chic_events/core/firestore/status.dart';
import 'package:chic_events/core/helper/package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  static String id = 'homepage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  void initState() {
    context.read<HomeBloc>().add(IndexCategories());
    context.read<HomeBloc>().add(IndexPackages());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                Image.asset('assets/images/134_floral copy.jpg'),
                Expanded(
                  child: SizedBox(
                    height: double.infinity,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Categories',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                width: 400,
                                height: 160,
                                child: Row(children: [
                                  Expanded(
                                    child: SizedBox(
                                        width: 200,
                                        child: switch (state.categoriesStatus) {
                                          RequestStatus.failed =>
                                            MainErrorWidget(onPressed: () {
                                              context
                                                  .read<HomeBloc>()
                                                  .add(IndexCategories());
                                            }),
                                          RequestStatus.success =>
                                            ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    state.categories.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: help(
                                                        image: state
                                                            .categories[index]
                                                            .image,
                                                        title: state
                                                            .categories[index]
                                                            .name),
                                                  );
                                                }),
                                          RequestStatus.loading =>
                                            ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Shimmer.fromColors(
                                                      baseColor:
                                                          Colors.grey.shade400,
                                                      highlightColor:
                                                          Colors.grey.shade200,
                                                      child: help(
                                                          image: '', title: ''),
                                                    ),
                                                  );
                                                }),
                                          _ => const SizedBox()
                                        }),
                                  ),
                                ]),
                              ),
                              const Text(
                                'Wedding pakeage',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                width: 450,
                                height: 215,
                                child: Row(children: [
                                  Expanded(
                                    child: SizedBox(
                                        width: 200,
                                        child: switch (state.packagesStatus) {
                                          RequestStatus.failed =>
                                            MainErrorWidget(onPressed: () {
                                              context
                                                  .read<HomeBloc>()
                                                  .add(IndexPackages());
                                            }),
                                          RequestStatus.success =>
                                            ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    state.packages.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Package(
                                                        name: state
                                                            .packages[index]
                                                            .name,
                                                        guest: state
                                                            .packages[index]
                                                            .capacity
                                                            .toString(),
                                                        photo: state
                                                            .packages[index]
                                                            .image,
                                                        price: state
                                                            .packages[index]
                                                            .price
                                                            .toString()),
                                                  );
                                                }),
                                          RequestStatus.loading =>
                                            ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Shimmer.fromColors(
                                                        baseColor: Colors
                                                            .grey.shade400,
                                                        highlightColor: Colors
                                                            .grey.shade200,
                                                        child: Package(
                                                            name: '',
                                                            guest: '',
                                                            photo: '',
                                                            price: '')),
                                                  );
                                                }),
                                          _ => const SizedBox(),
                                        }),
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Famous Wedding Venue',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                width: 450,
                                height: 215,
                                child: Row(children: [
                                  Expanded(
                                    child: SizedBox(
                                        width: 200,
                                        child: switch (state.packagesStatus) {
                                          RequestStatus.failed =>
                                            MainErrorWidget(onPressed: () {
                                              context
                                                  .read<HomeBloc>()
                                                  .add(IndexPackages());
                                            }),
                                          RequestStatus.success =>
                                            ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    state.packages.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Package(
                                                        name: state
                                                            .packages[index]
                                                            .name,
                                                        guest: state
                                                            .packages[index]
                                                            .capacity
                                                            .toString(),
                                                        photo: state
                                                            .packages[index]
                                                            .image,
                                                        price: state
                                                            .packages[index]
                                                            .price
                                                            .toString()),
                                                  );
                                                }),
                                          RequestStatus.loading =>
                                            ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Shimmer.fromColors(
                                                        baseColor: Colors
                                                            .grey.shade400,
                                                        highlightColor: Colors
                                                            .grey.shade200,
                                                        child: Package(
                                                            name: '',
                                                            guest: '',
                                                            photo: '',
                                                            price: '')),
                                                  );
                                                }),
                                          _ => const SizedBox(),
                                        }),
                                  ),
                                ]),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Trending decore',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                width: 450,
                                height: 215,
                                child: Row(children: [
                                  Expanded(
                                    child: SizedBox(
                                        width: 200,
                                        child: switch (state.packagesStatus) {
                                          RequestStatus.failed =>
                                            MainErrorWidget(onPressed: () {
                                              context
                                                  .read<HomeBloc>()
                                                  .add(IndexPackages());
                                            }),
                                          RequestStatus.success =>
                                            ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount:
                                                    state.packages.length,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Package(
                                                        name: state
                                                            .packages[index]
                                                            .name,
                                                        guest: state
                                                            .packages[index]
                                                            .capacity
                                                            .toString(),
                                                        photo: state
                                                            .packages[index]
                                                            .image,
                                                        price: state
                                                            .packages[index]
                                                            .price
                                                            .toString()),
                                                  );
                                                }),
                                          RequestStatus.loading =>
                                            ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: 5,
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Shimmer.fromColors(
                                                        baseColor: Colors
                                                            .grey.shade400,
                                                        highlightColor: Colors
                                                            .grey.shade200,
                                                        child: Package(
                                                            name: '',
                                                            guest: '',
                                                            photo: '',
                                                            price: '')),
                                                  );
                                                }),
                                          _ => const SizedBox(),
                                        }),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: 'Create Event',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child:
          ElevatedButton(onPressed: onPressed, child: const Text('Try Again')),
    );
  }
}

class help extends StatelessWidget {
  help({required this.image, required this.title});
  String? image;
  String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: image!.isNotEmpty ? NetworkImage(image!) : null,
          maxRadius: 45,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title!,
          style: const TextStyle(fontSize: 14),
        )
      ],
    );
  }
}
