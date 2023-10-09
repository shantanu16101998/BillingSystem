import 'package:billing_system/Configs/Constants.dart';
import 'package:flutter/material.dart';
import 'package:billing_system/components/Graph.dart';

class GraphContainer extends StatelessWidget {
  const GraphContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 75 * figmaHeightFactor),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.black,
          ),
          color: Colors.white, // Set the inner Container color to transparent
        ),
        height: 325 * figmaHeightFactor,
        width: 365,
        child: Column(
          children: [
            const SizedBox(height: 10 * figmaHeightFactor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 10),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Colors.black,
                      ),
                      color: Colors
                          .transparent, // Set the inner Container color to transparent
                    ),
                    width: 280,
                    height: 223 * figmaHeightFactor,
                    alignment: Alignment.center,
                    child: const Padding(
                      padding: EdgeInsets.only(top: 10, right: 25, left: 5),
                      // padding: EdgeInsets.all(0),

                      child: Graph(),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_right_rounded,
                      color: Color(0xFF55AABB), // Set the color to #55AABB
                      size: 50,
                    )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Sales past three months'),
            const SizedBox(
              height: 2 * figmaHeightFactor,
            ),
            Container(
              color: Colors.black,
              height: 1,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                //
                //
              ),
              width: 365,
              height: 43,
              child: TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  foregroundColor: MaterialStateProperty.all(figmaCyan),
                  overlayColor: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return figmawhite; // Splash color when clicking
                      }
                      return null; // Default overlay color
                    },
                  ),

                  // Set the color to #55AABB
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                child: const Text('View All'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
