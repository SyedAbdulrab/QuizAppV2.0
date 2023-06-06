import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: data['user_answer']==data['correct_answer']?const Color.fromARGB(255, 76, 206, 161):const Color.fromARGB(
                        255, 251, 153, 191),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  //start
                  child: Text(
                    textAlign: TextAlign.start,
                    ((data['question_index'] as int) + 1).toString(),
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 107, 15, 168),
                    ),
                  ),
                  //end
                ),
                Expanded(
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),
                      Container(
                        width: double.infinity,
                        margin:const EdgeInsets.only(left: 13),
                        child: Text(
                          textAlign: TextAlign.left,
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                          ),
                        ),
                      ),

                      // end
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        margin:const EdgeInsets.only(left: 13),
                        width: double.infinity,
                        child: Text(
                          textAlign: TextAlign.left,
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                            color:const Color.fromARGB(255, 201, 153, 251),
                          ),
                        ),
                      ),
                      Container(
                        margin:const EdgeInsets.only(left: 13),
                        width: double.infinity,
                        child: Text(
                          textAlign: TextAlign.left,
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            color:const Color.fromARGB(255, 76, 206, 161),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
