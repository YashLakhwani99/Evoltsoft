import 'package:evoltsoft/components/my_button.dart';
import 'package:evoltsoft/screens/help_screen.dart';
import 'package:evoltsoft/screens/navigate_screen.dart';
import 'package:evoltsoft/screens/payments_page.dart';
import 'package:evoltsoft/screens/share_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StationPage extends StatelessWidget {
  final Color color;
  final String uid;
  final String evseId;
  final String name;
  final String imageUrl;
  final String status;
  final String voltage;
  final String type;
  final int serviceFee;

  const StationPage({
    super.key,
    required this.color,
    required this.evseId,
    required this.uid,
    required this.name,
    required this.imageUrl,
    required this.status,
    required this.voltage,
    required this.type,
    required this.serviceFee,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          uid,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
            fontSize: 20,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HelpScreen(),
                  ),
                ),
                child: Container(
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: color,
                  ),
                  child: const Center(
                    child: Text(
                      "Help",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.local_gas_station_rounded,
                        size: 30,
                        color: Colors.grey.shade700,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        evseId,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                            color: Colors.black,
                          ),
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 30,
                        color: Colors.grey.shade700,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                          maxLines: null,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.clock_solid,
                        size: 28,
                        color: Colors.grey.shade700,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Open • 24 hours",
                        style: TextStyle(
                          color: Colors.green.shade900,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: Icon(
                          Icons.electrical_services_sharp,
                          size: 28,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Max.Volt. • ${voltage}V",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                          color: status == "AVAILABLE"
                              ? Colors.green
                              : status == "UNKNOWN"
                                  ? Colors.yellow
                                  : Colors.orange,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            status,
                            style: const TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        size: 29,
                        color: Colors.grey.shade700,
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "4.5 (20)",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "\$${serviceFee.toDouble()}/kW",
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavigateScreen(),
                          ),
                        ),
                        child: Container(
                          height: 50,
                          width: 175,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: color,
                              width: 3.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.location_fill,
                                size: 30,
                                color: Colors.grey.shade700,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "Navigate",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShareScreen(),
                          ),
                        ),
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                              color: color,
                              width: 3.0,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.share,
                                size: 30,
                                color: Colors.grey.shade700,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "Share",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Divider(
                    color: Colors.black,
                    endIndent: 5,
                    indent: 5,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "About",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Mauris cursus mattis molestie a iaculis at erat pellentesque. Quisque sagittis purus sit amet volutpat consequat mauris nunc. Massa ultricies mi quis hendrerit. Rutrum tellus pellentesque eu tincidunt tortor aliquam nulla. Enim sit amet venenatis urna cursus eget nunc. Faucibus vitae aliquet nec ullamcorper sit. Congue nisi vitae suscipit tellus mauris a diam maecenas sed. Proin sagittis nisl rhoncus mattis rhoncus urna neque viverra justo. Suspendisse interdum consectetur libero id faucibus. Tellus elementum sagittis vitae et leo duis ut diam quam.Odio morbi quis commodo odio aenean sed adipiscing diam donec. Platea dictumst vestibulum rhoncus est pellentesque elit ullamcorper dignissim. Nec dui nunc mattis enim ut tellus elementum. Sed cras ornare arcu dui vivamus. Vulputate sapien nec sagittis aliquam malesuada bibendum arcu vitae. Posuere sollicitudin aliquam ultrices sagittis. Ornare quam viverra orci sagittis eu. Nisl rhoncus mattis rhoncus urna neque viverra justo nec ultrices. Eu mi bibendum neque egestas congue quisque egestas diam in. Fames ac turpis egestas sed tempus urna et pharetra pharetra. Scelerisque in dictum non consectetur a erat. Arcu bibendum at varius vel pharetra vel turpis nunc. In fermentum et sollicitudin ac orci phasellus egestas. Aliquet porttitor lacus luctus accumsan. Aliquet lectus proin nibh nisl condimentum id. Ultrices mi tempus imperdiet nulla malesuada pellentesque elit eget gravida. Ac ut consequat semper viverra nam.",
                    maxLines: null,
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 25),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          color: color,
          child: MyButton(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PaymentPage(),
              ),
            ),
            text: "Charge here",
          ),
        ),
      ),
    );
  }
}
