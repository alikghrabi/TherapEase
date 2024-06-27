import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Controllers/DetailsTherapistController.dart';
import 'package:therapease/Models/Therapist.dart';
import '../Routes/AppRoute.dart';

class DetailsTherapist extends GetView<DetailsTherapistController> {
  const DetailsTherapist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Therapist therapist = Get.arguments as Therapist;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Therapist Details",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.search);
          },
          child: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Add functionality for more actions if needed
            },
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/default_avatar.png'), // Replace with therapist's profile picture
                  ),
                  SizedBox(height: 10),
                  Text(
                    therapist.name ?? '',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    therapist.email ?? '',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  if (therapist.cvFilePath != null && therapist.cvFilePath!.isNotEmpty)
                    ElevatedButton(
                      onPressed: () {
                        // Handle booking logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent, // Background color
                        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5), // Rounded corners
                        ),
                      ),
                      child: Text(
                        'View CV',
                        style: TextStyle(fontSize: 18, color: Colors.white), // Text style
                      ),
                    ),

                  SizedBox(height: 20),
                  if (therapist.descriptionProfile != null && therapist.descriptionProfile!.isNotEmpty)
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            therapist.descriptionProfile!,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 20),


                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.phone, size: 15, color: Colors.black87),
                      ),
                      SizedBox(width: 10),
                      Text(
                        therapist.phone ?? '',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.work, size: 15, color: Colors.black87),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5), // Adjust top padding as needed
                          child: Text(
                            therapist.experience != null ? 'Experience: ${therapist.experience} years' : '',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      // Handle booking logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent, // Background color
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16), // Padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    child: Text(
                      'Book Appointment',
                      style: TextStyle(fontSize: 18, color: Colors.white), // Text style
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
