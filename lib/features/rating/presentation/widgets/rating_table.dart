import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/rating_bloc.dart';

class RatingTable extends StatefulWidget {
  const RatingTable({
    Key? key,
  }) : super(key: key);

  @override
  State<RatingTable> createState() => _RatingTableState();
}

class _RatingTableState extends State<RatingTable> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingBloc, RatingState>(
      builder: (context, state) {
        if (state is RatingSuccessState) {
          return state.ratingModel.count == 0
              ? const Center(
                  child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red, fontSize: 24),
                      "Bu mavzu buyicha ishtirokchilar mavjud emas"),
                )
              : Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 2)),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Ishtirokchi ismi",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                          Text("Ball",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                        ],
                      ),
                      const Divider(thickness: 2,color: Colors.black,),
                      SizedBox(
                        height: 400,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.ratingModel.count,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.blue, Colors.green],
                                      // Example gradient colors
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                          width: 200,
                                          child: Text(state.ratingModel
                                                  .results?[index].fullName ??
                                              "")),
                                      SizedBox(
                                          width: 50,
                                          child: Text(state
                                                  .ratingModel
                                                  .results?[index]
                                                  .countRightAnswers
                                                  .toString() ??
                                              "")),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
        }
        if (state is RatingErrorState) {
          return const Center(child: Text("Error"));
        }
        return const Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Center(child: CircularProgressIndicator()),
          ],
        );
      },
    );
  }
}
