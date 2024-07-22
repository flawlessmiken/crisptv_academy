import 'package:cripstv_academy/core/model/job_details.dart';
import 'package:flutter/material.dart';

class JobDetailsContainer extends StatelessWidget {
  final JobDetails jobDetails;
  final VoidCallback onApplyPressed;

  JobDetailsContainer({
    required this.jobDetails,
    required this.onApplyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                jobDetails.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                jobDetails.rate,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            jobDetails.location,
            style: const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 10.0),
          Text(
            jobDetails.description,
            maxLines: 3,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const Text(
                'Skill:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Text(
                  jobDetails.skills,
                  maxLines: 2,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: onApplyPressed,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child:  const Text('Apply'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
