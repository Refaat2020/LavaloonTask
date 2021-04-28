import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lavaloon/cubits/client_cubit.dart';
import 'package:lavaloon/cubits/projects_cubit.dart';
import 'package:lavaloon/cubits/time_cubit.dart';
import 'package:lavaloon/ui/screens/second_story_info_screen.dart';
import 'package:lavaloon/ui/screens/time_detials_screen.dart';
import 'package:lavaloon/ui/widgets/loading_widget.dart';
import 'package:lavaloon/ui/widgets/time_card_widget.dart';
import 'package:provider/provider.dart';

///for get timeEntries in specific time
class SecondStoryScreen extends StatefulWidget {
  @override
  _SecondStoryScreenState createState() => _SecondStoryScreenState();
}

class _SecondStoryScreenState extends State<SecondStoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TimeCubit>().getTimeForLastMonth(context);
  }

  @override
  Widget build(BuildContext context) {
    final projects = context.watch<ProjectsCubit>().projects;
    final clients = context.watch<ClientCubit>().clientList;
    final time = context.watch<TimeCubit>().timeEntries;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white60,
        title: FlatButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.red,
            ),
            label: Text("Toggl")),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 190, bottom: 50, top: 20),
                child: Text("WORKING ON THESE?"),
              ),
              BlocConsumer<TimeCubit, TimeState>(
                listener: (context, state) {
                  if (state is ClientError) {
                    Fluttertoast.showToast(
                      msg:"error",
                      textColor: Colors.black,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.SNACKBAR,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is TimeLoading) {
                    return LoadingWidget();
                  } else if (state is TimeFetched) {
                    return Container(
                      width: 350,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          String projectId = time[index].pid.toString();
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SecondStoryInfo(
                                      projectId: projectId,
                                    ),
                                  ));
                            },
                            child: ProjectInfo(
                              hashtag: time[index].duration.toString(),
                              clientName:time[index].stop.toIso8601String().substring(0,10),
                              projectName: time[index].start.toString().substring(0,10),
                              textColor: Colors.blue,
                            ),
                          );
                        },
                        itemCount: time.length,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
